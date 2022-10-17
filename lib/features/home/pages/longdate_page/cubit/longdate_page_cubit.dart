import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:moja_lodowka/app/core/enums.dart';
import 'package:moja_lodowka/domain/models/longdate_document_model/longdate_document_model.dart';
import 'package:moja_lodowka/domain/repositories/longdate_documents_repository/longdate_documents_repository.dart';

part 'longdate_page_state.dart';

class LongdatePageCubit extends Cubit<LongdatePageState> {
  LongdatePageCubit(this._documentsRepository)
      : super(
          const LongdatePageState(
              documents: [], status: Status.initial, errorMessage: ''),
        );

  final LongDateDocumentsRepository _documentsRepository;

  StreamSubscription? _streamSubscription;

  Future<void> add(String title, DateTime expDate) async {
    await _documentsRepository.add(title, expDate);
  }

  Future<void> delete({required String document}) async {
    await _documentsRepository.delete(document: document);
  }

  Future<void> start() async {
    emit(
      const LongdatePageState(
          documents: [], status: Status.loading, errorMessage: ''),
    );
    _streamSubscription =
        _documentsRepository.getLongDateDocuments().listen((documents) {
      emit(LongdatePageState(
          documents: documents, status: Status.success, errorMessage: ''));
    })
          ..onError((error) {
            emit(LongdatePageState(
              documents: const [],
              status: Status.error,
              errorMessage: error.toString(),
            ));
          });
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
