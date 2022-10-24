part of 'shoplist_page_cubit.dart';

@freezed
class ShopListPageState with _$ShopListPageState {
  factory ShopListPageState({
    required List<ShopListDocumentModel> documents,
    required Status status,
    required String? errorMessage,
  }) = _ShopListPageState;
}
