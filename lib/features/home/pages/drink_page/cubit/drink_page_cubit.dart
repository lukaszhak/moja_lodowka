import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:moja_lodowka/app/core/enums.dart';
import 'package:moja_lodowka/domain/models/drink_document_model/drink_document_model.dart';
import 'package:moja_lodowka/domain/repositories/drink_documents_repository/drink_documents_repository.dart';

part 'drink_page_state.dart';
part 'drink_page_cubit.freezed.dart';

@injectable
class DrinkPageCubit extends Cubit<DrinkPageState> {
  DrinkPageCubit(this._documentsRepository)
      : super(
          DrinkPageState(
              documents: [],
              status: Status.initial,
              errorMessage: '',
              title: null,
              expDate: null),
        );

  final DrinkDocumentsRepository _documentsRepository;

  StreamSubscription? _streamSubscription;

  Future<void> onDateChanged({required DateTime? expDate}) async {
    emit(
      state.copyWith(expDate: expDate),
    );
  }

  Future<void> onTitleChanged({required String title}) async {
    emit(
      state.copyWith(title: title),
    );
  }

  Future<void> generateNotificationId(int notificationId) async {
    emit(
      state.copyWith(notificationId: notificationId),
    );
  }

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
      state.copyWith(status: Status.loading),
    );
    try {
      _streamSubscription =
          _documentsRepository.getDrinksDocuments().listen((documents) {
        emit(
          state.copyWith(documents: documents, status: Status.success),
        );
      });
    } catch (error) {
      emit(
        state.copyWith(
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
