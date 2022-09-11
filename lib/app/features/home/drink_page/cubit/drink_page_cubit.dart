import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'drink_page_state.dart';

class DrinkPageCubit extends Cubit<DrinkPageState> {
  DrinkPageCubit()
      : super(const DrinkPageState(
          documents: [],
          errorMessage: '',
          isLoading: false,
        ));

  StreamSubscription? _streamSubscription;

  Future<void> add({required String title}) async {
    await FirebaseFirestore.instance.collection('napoje').add(
      {'title': title},
    );
  }

  Future<void> delete({required String document}) async {
    await FirebaseFirestore.instance
        .collection('napoje')
        .doc(document)
        .delete();
  }

  Future<void> start() async {
    emit(
      const DrinkPageState(
        documents: [],
        errorMessage: '',
        isLoading: true,
      ),
    );

    _streamSubscription = FirebaseFirestore.instance
        .collection('napoje')
        .orderBy('title')
        .snapshots()
        .listen((data) {
      emit(
        DrinkPageState(
          documents: data.docs,
          isLoading: false,
          errorMessage: '',
        ),
      );
    })
      ..onError((error) {
        emit(
          DrinkPageState(
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
