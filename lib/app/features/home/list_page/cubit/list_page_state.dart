part of 'list_page_cubit.dart';

@immutable
class ListPageState {
  final List<QueryDocumentSnapshot<Object?>> documents;
  final bool isLoading;
  final String errorMessage;

  const ListPageState(
      {required this.documents,
      required this.isLoading,
      required this.errorMessage});
}
