part of 'expenses_page_cubit.dart';

class ExpensesPageState {
  ExpensesPageState({required this.documents, required this.status, required this.errorMessage});

  final List<ExpensesDocumentModel> documents;
  final Status status;
  final String? errorMessage;

}
