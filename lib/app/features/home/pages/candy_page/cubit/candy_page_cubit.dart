import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:moja_lodowka/app/core/enums.dart';
import 'package:moja_lodowka/app/features/home/pages/candy_page/model/candy_document_model.dart';
import 'package:moja_lodowka/app/features/home/pages/candy_page/repository/candy_documents_repository.dart';

part 'candy_page_state.dart';

class CandyPageCubit extends Cubit<CandyPageState> {
  CandyPageCubit(this._documentsRepository)
      : super(const CandyPageState(
            documents: [], status: Status.initial, errorMessage: ''));
  final CandyDocumentsRepository _documentsRepository;

  StreamSubscription? _streamSubscription;

  Future<void> add(String title, DateTime expDate) async {
    await _documentsRepository.add(title, expDate);
  }

  Future<void> delete({required String document}) async {
    await _documentsRepository.delete(document: document);
  }

  Future<void> start() async {
    emit(
      const CandyPageState(
          documents: [], status: Status.loading, errorMessage: ''),
    );
    _streamSubscription =
        _documentsRepository.getCandysDocuments().listen((documents) {
      emit(CandyPageState(
          documents: documents,
          status: Status.success,
          errorMessage: ''));
    })
          ..onError((error) {
            emit(
              CandyPageState(
                documents: const [],
                status: Status.error,
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
