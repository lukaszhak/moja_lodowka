import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:moja_lodowka/app/core/enums.dart';
import 'package:moja_lodowka/domain/models/fridge_document_model/fridge_document_model.dart';
import 'package:moja_lodowka/domain/repositories/fridge_documents_repository/fridge_documents_repository.dart';

part 'fridge_page_state.dart';
part 'fridge_page_cubit.freezed.dart';

@injectable
class FridgePageCubit extends Cubit<FridgePageState> {
  FridgePageCubit(this._documentsRepository)
      : super(
          FridgePageState(
              documents: [], status: Status.initial, errorMessage: ''),
        );

  final FridgeDocumentsRepository _documentsRepository;

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
      FridgePageState(documents: [], status: Status.loading, errorMessage: ''),
    );
    try {
      _streamSubscription =
          _documentsRepository.getFridgeDocuments().listen((documents) {
        emit(
          FridgePageState(
              documents: documents, status: Status.success, errorMessage: ''),
        );
      });
    } catch (error) {
      emit(
        FridgePageState(
          documents: const [],
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
