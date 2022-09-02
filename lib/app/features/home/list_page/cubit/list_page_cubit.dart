import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'list_page_state.dart';

class ListPageCubit extends Cubit<ListPageState> {
  ListPageCubit()
      : super(
          const ListPageState(
            documents: [],
            errorMessage: '',
            isLoading: false,
          ),
        );

  StreamSubscription? _streamSubscription;

  Future<void> add({required String title}) async {
    await FirebaseFirestore.instance.collection('lista').add({'title': title});
  }

  Future<void> delete({required String document}) async {
    await FirebaseFirestore.instance.collection('lista').doc(document).delete();
  }

  Future<void> start() async {
    emit(
      const ListPageState(
        documents: [],
        isLoading: true,
        errorMessage: '',
      ),
    );

    _streamSubscription = FirebaseFirestore.instance
        .collection('lista')
        .snapshots()
        .listen((data) {
      emit(
        ListPageState(
          documents: data.docs,
          isLoading: false,
          errorMessage: '',
        ),
      );
    })
      ..onError((error) {
        emit(
          ListPageState(
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
