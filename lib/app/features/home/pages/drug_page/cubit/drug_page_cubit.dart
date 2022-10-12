import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:moja_lodowka/app/core/enums.dart';
import 'package:moja_lodowka/app/features/home/pages/drug_page/model/drug_document_model.dart';
import 'package:moja_lodowka/app/features/home/pages/drug_page/repository/drug_documents_repository.dart';

part 'drug_page_state.dart';

class DrugPageCubit extends Cubit<DrugPageState> {
  DrugPageCubit(this._documentsRepository)
      : super(
          const DrugPageState(
              documents: [], status: Status.initial, errorMessage: ''),
        );

  final DrugDocumentsRepository _documentsRepository;

  StreamSubscription? _streamSubscription;

  Future<void> add(String title, DateTime expDate) async {
    await _documentsRepository.add(title, expDate);
  }

  Future<void> delete({required String document}) async {
    await _documentsRepository.delete(document: document);
  }

  Future<void> start() async {
    emit(
      const DrugPageState(
          documents: [], status: Status.loading, errorMessage: ''),
    );
    _streamSubscription =
        _documentsRepository.getDocumentsStream().listen((documents) {
      emit(
        DrugPageState(
            documents: documents, status: Status.success, errorMessage: ''),
      );
    })
          ..onError((error) {
            emit(
              DrugPageState(
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
