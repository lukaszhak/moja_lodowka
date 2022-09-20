import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:moja_lodowka/app/features/home/candy_page/model/candy_document_model.dart';
import 'package:moja_lodowka/app/features/home/candy_page/repository/candy_documents_repository.dart';

part 'candy_page_state.dart';

class CandyPageCubit extends Cubit<CandyPageState> {
  CandyPageCubit(this._documentsRepository)
      : super(const CandyPageState(
          documents: [],
        ));
  final CandyDocumentsRepository _documentsRepository;

  StreamSubscription? _streamSubscription;

  Future<void> add(String title, DateTime expDate) async {
    await FirebaseFirestore.instance.collection('slodycze').add(
      {'title': title, 'expdate': expDate},
    );
  }

  Future<void> delete({required String document}) async {
    await FirebaseFirestore.instance
        .collection('slodycze')
        .doc(document)
        .delete();
  }

  Future<void> start() async {
    _streamSubscription =
        _documentsRepository.getDocumentsStream().listen((documents) {
      emit(CandyPageState(documents: documents));
    });
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
