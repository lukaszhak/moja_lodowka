import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:moja_lodowka/app/core/enums.dart';
import 'package:moja_lodowka/domain/models/longdate_document_model/longdate_document_model.dart';
import 'package:moja_lodowka/domain/repositories/longdate_documents_repository/longdate_documents_repository.dart';

part 'longdate_page_state.dart';
part 'longdate_page_cubit.freezed.dart';

@injectable
class LongDatePageCubit extends Cubit<LongDatePageState> {
  LongDatePageCubit(this._documentsRepository)
      : super(
          LongDatePageState(
              documents: [], status: Status.initial, errorMessage: ''),
        );

  final LongDateDocumentsRepository _documentsRepository;

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
      LongDatePageState(
          documents: [], status: Status.loading, errorMessage: ''),
    );
    _streamSubscription =
        _documentsRepository.getLongDateDocuments().listen((documents) {
      emit(LongDatePageState(
          documents: documents, status: Status.success, errorMessage: ''));
    })
          ..onError((error) {
            emit(LongDatePageState(
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
