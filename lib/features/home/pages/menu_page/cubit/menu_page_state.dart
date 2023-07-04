part of 'menu_page_cubit.dart';

@freezed
class MenuPageState with _$MenuPageState {
  factory MenuPageState({
    required List<MenuDocumentModel> documents,
    required Status status,
    required String? errorMessage,
    required int currentIndex
  }) = _MenuPageState;
}
