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

  Future<void> onCategoryChanged({required String category}) async {
    emit(
      state.copyWith(category: category),
    );
  }

  Future<void> onAmountChanged({required String amount}) async {
    emit(
      state.copyWith(amount: amount),
    );
  }

  Future<void> onDateChanged({required DateTime? expensesDate}) async {
    emit(
      state.copyWith(expensesDate: expensesDate),
    );
  }

  Future<void> onTitleChanged({required String title}) async {
    emit(
      state.copyWith(title: title),
    );
  }

  Future<void> addDoc(
      String title, String category, num amount, DateTime expensesDate) async {
    _documentsRepository.addDocument(title, category, amount, expensesDate);
  }

  Future<void> deleteDoc({required String document}) async {
    _documentsRepository.deleteDocument(document: document);
  }

  Future<void> start() async {
    emit(
      state.copyWith(status: Status.loading),
    );
    try {
      _streamSubscription =
          _documentsRepository.getExpensesDocuments().listen((documents) {
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
