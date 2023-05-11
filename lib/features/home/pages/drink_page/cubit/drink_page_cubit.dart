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
      : super(DrinkPageState(
            documents: [], status: Status.initial, errorMessage: ''));
  final DrinkDocumentsRepository _documentsRepository;

  StreamSubscription? _streamSubscription;

  Future<void> scheduleNotification(DateTime expDate, BuildContext context,
      String? title, int notificationId) async {
    await _documentsRepository.notification(
        expDate, context, title, notificationId);
  }

  Future<void> cancelNotification(int notificationId) async {
    await _documentsRepository.cancelNotification(notificationId);
  }

  Future<void> add(String title, DateTime expDate) async {
    await _documentsRepository.add(title, expDate);
  }

  Future<void> delete({required String document}) async {
    await _documentsRepository.delete(document: document);
  }

  Future<void> start() async {
    emit(DrinkPageState(
        documents: [], status: Status.loading, errorMessage: ''));

    _streamSubscription =
        _documentsRepository.getDrinksDocuments().listen((documents) {
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
