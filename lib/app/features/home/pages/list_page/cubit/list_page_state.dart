part of 'list_page_cubit.dart';

@immutable
class ListPageState {
  final List<ListDocumentModel> documents;
  final Status status;
  final String? errorMessage;

  const ListPageState({
    required this.documents,
    required this.status,
    required this.errorMessage
  });
}
