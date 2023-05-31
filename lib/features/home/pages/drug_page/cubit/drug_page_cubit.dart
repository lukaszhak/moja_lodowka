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

  Future<void> scheduleNotification(DateTime expDate, BuildContext context,
      String? title, int notificationId) async {
    await _documentsRepository.addNotification(
        expDate, context, title, notificationId);
  }

  Future<void> cancelNotification(int notificationId) async {
    await _documentsRepository.cancelNotification(notificationId);
  }

  Future<void> addDoc(
      String title, DateTime expDate, int notificationId) async {
    await _documentsRepository.addDocument(title, expDate, notificationId);
  }

  Future<void> deleteDoc({required String document}) async {
    await _documentsRepository.deleteDocument(document: document);
  }

  Future<void> start() async {
    emit(
      DrugPageState(documents: [], status: Status.loading, errorMessage: ''),
    );
    try {
      _streamSubscription =
          _documentsRepository.getDrugsDocuments().listen((documents) {
        emit(
          DrugPageState(
              documents: documents, status: Status.success, errorMessage: ''),
        );
      });
    } catch (error) {
      emit(
        DrugPageState(
          documents: [],
          status: Status.error,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
