import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'candy_page_state.dart';

class CandyPageCubit extends Cubit<CandyPageState> {
  CandyPageCubit()
      : super(const CandyPageState(
          documents: [],
          errorMessage: '',
          isLoading: false,
        ));

  StreamSubscription? _streamSubscription;

  Future<void> add({
    required String title,
  }) async {
    await FirebaseFirestore.instance.collection('slodycze').add(
      {'title': title},
    );
  }

  Future<void> delete({required String document}) async {
    await FirebaseFirestore.instance
        .collection('slodycze')
        .doc(document)
        .delete();
  }

  Future<void> start() async {
    emit(
      const CandyPageState(
        documents: [],
        errorMessage: '',
        isLoading: true,
      ),
    );

    _streamSubscription = FirebaseFirestore.instance
        .collection('slodycze')
        .orderBy('title')
        .snapshots()
        .listen((data) {
      emit(
        CandyPageState(
          documents: data.docs,
          isLoading: false,
          errorMessage: '',
        ),
      );
    })
      ..onError((error) {
        emit(
          CandyPageState(
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
