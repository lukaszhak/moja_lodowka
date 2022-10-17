part of 'drink_page_cubit.dart';

@immutable
class DrinkPageState {
  final List<DrinkDocumentModel> documents;
  final Status status;
  final String? errorMessage;

  const DrinkPageState({
    required this.documents,
    required this.status,
    required this.errorMessage,
  });
}
