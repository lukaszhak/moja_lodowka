import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:moja_lodowka/app/core/enums.dart';
import 'package:moja_lodowka/domain/models/drug_document_model/drug_document_model.dart';
import 'package:moja_lodowka/domain/repositories/drug_documents_repository/drug_documents_repository.dart';

part 'drug_page_state.dart';
part 'drug_page_cubit.freezed.dart';

@injectable
class DrugPageCubit extends Cubit<DrugPageState> {
  DrugPageCubit(this._documentsRepository)
      : super(
          DrugPageState(
              documents: [], status: Status.initial, errorMessage: ''),
        );

  final DrugDocumentsRepository _documentsRepository;

  StreamSubscription? _streamSubscription;

  Future<void> scheduleNotification(DateTime expDate, BuildContext context, String? title, int notificationId) async {
    await _documentsRepository.notification(
        expDate, context, title, notificationId);
  }

  Future<void> cancelNotification(int notificationId) async {
    await _documentsRepository.cancelNotification(notificationId);
  }

  Future<void> add(String title, DateTime expDate, int notificationId) async {
    await _documentsRepository.add(title, expDate, notificationId);
  }

  Future<void> delete({required String document}) async {
    await _documentsRepository.delete(document: document);
  }

  Future<void> start() async {
    emit(
      DrugPageState(documents: [], status: Status.loading, errorMessage: ''),
    );
    _streamSubscription =
        _documentsRepository.getDrugsDocuments().listen((documents) {
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
