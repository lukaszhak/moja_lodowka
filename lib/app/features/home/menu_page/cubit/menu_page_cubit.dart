import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:meta/meta.dart';

part 'menu_page_state.dart';

class MenuPageCubit extends Cubit<MenuPageState> {
  MenuPageCubit()
      : super(
          const MenuPageState(
            documents: [],
            errorMessage: '',
            isLoading: false,
          ),
        );

  StreamSubscription? _streamSubscription;

  Future<void> update({required String content}) async {
    await FirebaseFirestore.instance.collection('przepisy').doc().update({
      'content' : content
    });
  }

  Future<void> add({required String title, required String content}) async {
    await FirebaseFirestore.instance
        .collection('przepisy')
        .add({'title': title, 'content': content});
  }

  Future<void> delete({required String document}) async {
    await FirebaseFirestore.instance
        .collection('przepisy')
        .doc(document)
        .delete();
  }

  Future<void> start() async {
    emit(
      const MenuPageState(
        documents: [],
        isLoading: true,
        errorMessage: '',
      ),
    );

    _streamSubscription = FirebaseFirestore.instance
        .collection('przepisy')
        .orderBy('title')
        .snapshots()
        .listen((data) {
      emit(
        MenuPageState(
          documents: data.docs,
          isLoading: false,
          errorMessage: '',
        ),
      );
    })
      ..onError((error) {
        emit(
          MenuPageState(
            documents: const [],
            isLoading: false,
            errorMessage: error.toString(),
          ),
        );
      });
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
