part of 'candy_page_cubit.dart';

@immutable
class CandyPageState {
  final List<QueryDocumentSnapshot<Object?>> documents;
  final bool isLoading;
  final String errorMessage;

  const CandyPageState({
    required this.documents,
    required this.isLoading,
    required this.errorMessage,
  });
}
