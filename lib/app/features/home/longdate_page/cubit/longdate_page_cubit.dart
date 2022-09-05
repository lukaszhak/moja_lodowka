import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'longdate_page_state.dart';

class LongdatePageCubit extends Cubit<LongdatePageState> {
  LongdatePageCubit()
      : super(
          const LongdatePageState(
            documents: [],
            errorMessage: '',
            isLoading: false,
          ),
        );

  StreamSubscription? _streamSubscription;

  Future<void> add({required String title}) async {
    await FirebaseFirestore.instance.collection('data').add({'title': title});
  }

  Future<void> delete({required String document}) async {
    await FirebaseFirestore.instance.collection('data').doc(document).delete();
  }

  Future<void> start() async {
    emit(
      const LongdatePageState(
        documents: [],
        isLoading: true,
        errorMessage: '',
      ),
    );

    _streamSubscription = FirebaseFirestore.instance
        .collection('data')
        .orderBy('title')
        .snapshots()
        .listen((data) {
      emit(
        LongdatePageState(
          documents: data.docs,
          isLoading: false,
          errorMessage: '',
        ),
      );
    })
      ..onError((error) {
        emit(
          LongdatePageState(
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
