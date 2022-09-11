part of 'longdate_page_cubit.dart';

@immutable
class LongdatePageState {
  final List<QueryDocumentSnapshot<Object?>> documents;
  final bool isLoading;
  final String errorMessage;

  const LongdatePageState(
      {required this.documents,
      required this.isLoading,
      required this.errorMessage});
}
