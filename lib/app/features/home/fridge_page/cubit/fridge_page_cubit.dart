import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'fridge_page_state.dart';

class FridgePageCubit extends Cubit<FridgePageState> {
  FridgePageCubit()
      : super(const FridgePageState(
          documents: [],
          errorMessage: '',
          isLoading: false,
        ));

  StreamSubscription? _streamSubscription;

  Future<void> add({required String title}) async {
    await FirebaseFirestore.instance
        .collection('lodowka')
        .add({'title': title});
  }

  Future<void> delete({required String document}) async {
    await FirebaseFirestore.instance
        .collection('lodowka')
        .doc(document)
        .delete();
  }

  Future<void> start() async {
    emit(
      const FridgePageState(
        documents: [],
        isLoading: true,
        errorMessage: '',
      ),
    );

    _streamSubscription = FirebaseFirestore.instance
        .collection('lodowka')
        .snapshots()
        .listen((data) {
      emit(
        FridgePageState(
          documents: data.docs,
          isLoading: false,
          errorMessage: '',
        ),
      );
    })
      ..onError((error) {
        emit(
          FridgePageState(
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
