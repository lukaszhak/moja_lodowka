import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'drug_page_state.dart';

class DrugPageCubit extends Cubit<DrugPageState> {
  DrugPageCubit()
      : super(
          const DrugPageState(
              documents: [], errorMessage: '', isLoading: false),
        );

  StreamSubscription? _streamSubscription;

  Future<void> add({required String title}) async {
    await FirebaseFirestore.instance.collection('leki').add({'title': title});
  }

  Future<void> delete({required String document}) async {
    await FirebaseFirestore.instance.collection('leki').doc(document).delete();
  }

  Future<void> start() async {
    emit(
      const DrugPageState(
        documents: [],
        isLoading: true,
        errorMessage: '',
      ),
    );

    _streamSubscription = FirebaseFirestore.instance
        .collection('leki')
        .orderBy('title')
        .snapshots()
        .listen((data) {
      emit(
        DrugPageState(
          documents: data.docs,
          isLoading: false,
          errorMessage: '',
        ),
      );
    })
      ..onError((error) {
        emit(
          DrugPageState(
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
