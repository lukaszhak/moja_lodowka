import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:moja_lodowka/app/core/enums.dart';
import 'package:moja_lodowka/domain/models/candy_document_model/candy_document_model.dart';
import 'package:moja_lodowka/domain/repositories/candy_documents_repository/candy_documents_repository.dart';

part 'candy_page_state.dart';
part 'candy_page_cubit.freezed.dart';

@injectable
class CandyPageCubit extends Cubit<CandyPageState> {
  CandyPageCubit(this._documentsRepository)
      : super(CandyPageState(
            documents: [], status: Status.initial, errorMessage: ''));
  final CandyDocumentsRepository _documentsRepository;

  StreamSubscription? _streamSubscription;

  Future<void> scheduleNotification(DateTime expDate, BuildContext context,
      String? title, int notificationId) async {
    await _documentsRepository.addNotification(
        expDate, context, title, notificationId);
  }

  Future<void> cancelNotification(int notificationId) async {
    await _documentsRepository.cancelNotification(notificationId);
  }

  Future<void> addDoc(String title, DateTime expDate, int notificationId) async {
    await _documentsRepository.addDocument(title, expDate, notificationId);
  }

  Future<void> deleteDoc({required String document}) async {
    await _documentsRepository.deleteDocument(document: document);
  }

  Future<void> start() async {
    emit(
      CandyPageState(documents: [], status: Status.loading, errorMessage: ''),
    );
    try {
      _streamSubscription =
          _documentsRepository.getCandysDocuments().listen((documents) {
        emit(CandyPageState(
            documents: documents, status: Status.success, errorMessage: ''));
      });
    } catch (error) {
      emit(
        CandyPageState(
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
