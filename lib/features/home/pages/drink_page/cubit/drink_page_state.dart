part of 'drink_page_cubit.dart';

@freezed
class DrinkPageState with _$DrinkPageState {
  factory DrinkPageState({
    required List<DrinkDocumentModel> documents,
    required Status status,
    required String? errorMessage,
  }) = _DrinkPageState;
}
