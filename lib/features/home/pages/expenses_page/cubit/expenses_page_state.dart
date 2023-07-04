part of 'expenses_page_cubit.dart';

@freezed
class ExpensesPageState with _$ExpensesPageState {
  factory ExpensesPageState({
    required List<ExpensesDocumentModel> documents,
    required Status status,
    required String? errorMessage,
    DateTime? expensesDate,
    String? title,
    String? category,
    String? amount
  }) = _ExpensesPageState;
}
