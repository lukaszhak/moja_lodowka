part of 'longdate_page_cubit.dart';

@immutable
class LongdatePageState {
  final List<LongDateDocumentModel> documents;
  final Status status;
  final String? errorMessage;

  const LongdatePageState(
      {required this.documents,
      required this.status,
      required this.errorMessage});
}
