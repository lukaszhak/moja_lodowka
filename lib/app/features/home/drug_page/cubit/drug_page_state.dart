part of 'drug_page_cubit.dart';

@immutable
class DrugPageState {
  final List<DrugDocumentModel> documents;
  final Status status;
  final String? errorMessage;

  const DrugPageState({
    required this.documents,
    required this.status,
    required this.errorMessage
  });
}
