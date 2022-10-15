import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:moja_lodowka/app/core/enums.dart';
import 'package:moja_lodowka/app/features/home/pages/drink_page/model/drink_document_model.dart';
import 'package:moja_lodowka/app/features/home/pages/drink_page/repository/drink_documents_repository.dart';

part 'drink_page_state.dart';

class DrinkPageCubit extends Cubit<DrinkPageState> {
  DrinkPageCubit(this._documentsRepository)
      : super(const DrinkPageState(
            documents: [], status: Status.initial, errorMessage: ''));
  final DrinkDocumentsRepository _documentsRepository;

  StreamSubscription? _streamSubscription;

  Future<void> add(String title, DateTime expDate) async {
    await _documentsRepository.add(title, expDate);
  }

  Future<void> delete({required String document}) async {
    await _documentsRepository.delete(document: document);
  }

  Future<void> start() async {
    emit(const DrinkPageState(
        documents: [], status: Status.loading, errorMessage: ''));

    _streamSubscription =
        _documentsRepository.getDocumentsStream().listen((documents) {
      emit(DrinkPageState(
          documents: documents, status: Status.success, errorMessage: ''));
    })
          ..onError((error) {
            emit(
              DrinkPageState(
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