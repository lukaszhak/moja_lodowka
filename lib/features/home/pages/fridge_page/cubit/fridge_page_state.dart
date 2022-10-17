part of 'fridge_page_cubit.dart';

@immutable
class FridgePageState {
  final List<FridgeDocumentModel> documents;
  final Status status;
  final String? errorMessage;

  const FridgePageState({
    required this.documents,
    required this.status,
    required this.errorMessage
  });
}
