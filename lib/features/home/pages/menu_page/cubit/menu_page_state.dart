part of 'menu_page_cubit.dart';

@immutable
class MenuPageState {
  final List<MenuDocumentModel> documents;
  final Status status;
  final String? errorMessage;

  const MenuPageState(
      {required this.documents,
      required this.status,
      required this.errorMessage,});
}
