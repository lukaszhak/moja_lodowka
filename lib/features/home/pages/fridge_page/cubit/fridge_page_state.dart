part of 'fridge_page_cubit.dart';

@freezed
class FridgePageState with _$FridgePageState {
  factory FridgePageState({
    required List<FridgeDocumentModel> documents,
    required Status status,
    required String? errorMessage,
  }) = _FridgePageState;
}
