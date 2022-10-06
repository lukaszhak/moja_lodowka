part of 'candy_page_cubit.dart';

@immutable
class CandyPageState {
  final List<CandyDocumentModel> documents;
  final Status status;
  final String? errorMessage;

  const CandyPageState({
    required this.documents,
    required this.status,
    required this.errorMessage
  });
}
