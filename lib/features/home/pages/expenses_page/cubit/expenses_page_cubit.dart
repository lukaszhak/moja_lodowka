import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:moja_lodowka/app/core/enums.dart';
import 'package:moja_lodowka/domain/models/expenses_document_model/expenses_document_model.dart';
import 'package:moja_lodowka/domain/repositories/expenses_documents_repository/expenses_documents_repository.dart';

part 'expenses_page_state.dart';
part 'expenses_page_cubit.freezed.dart';

@injectable
class ExpensesPageCubit extends Cubit<ExpensesPageState> {
  ExpensesPageCubit(this._documentsRepository)
      : super(
          ExpensesPageState(
              documents: [], status: Status.initial, errorMessage: ''),
        );

  final ExpensesDocumentsRepository _documentsRepository;

  StreamSubscription? _streamSubscription;

  Future<void> addDoc(
      String title, String category, num amount, DateTime expensesDate) async {
    _documentsRepository.addDocument(title, category, amount, expensesDate);
  }

  Future<void> deleteDoc({required String document}) async {
    _documentsRepository.deleteDocument(document: document);
  }

  Future<void> start() async {
    emit(
      ExpensesPageState(
          documents: [], status: Status.loading, errorMessage: ''),
    );
    try {
      _streamSubscription =
          _documentsRepository.getExpensesDocuments().listen((documents) {
        emit(
          ExpensesPageState(
              documents: documents, status: Status.success, errorMessage: ''),
        );
      });
    } catch (error) {
      emit(
        ExpensesPageState(
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
