import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:moja_lodowka/app/features/home/drink_page/model/drink_document_model.dart';
import 'package:moja_lodowka/app/features/home/drink_page/repository/drink_documents_repository.dart';

part 'drink_page_state.dart';

class DrinkPageCubit extends Cubit<DrinkPageState> {
  DrinkPageCubit(this._documentsRepository)
      : super(const DrinkPageState(
          documents: [],
        ));
  final DrinkDocumentsRepository _documentsRepository;

  StreamSubscription? _streamSubscription;

  Future<void> add(String title, DateTime expdate) async {
    await FirebaseFirestore.instance.collection('napoje').add(
      {'title': title, 'expdate': expdate},
    );
  }

  Future<void> delete({required String document}) async {
    await FirebaseFirestore.instance
        .collection('napoje')
        .doc(document)
        .delete();
  }

  Future<void> start() async {
    _streamSubscription =
        _documentsRepository.getDocumentsStream().listen((documents) {
      emit(DrinkPageState(
        documents: documents,
      ));
    });
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
