part of 'drug_page_cubit.dart';

@immutable
class DrugPageState {
  final List<QueryDocumentSnapshot<Object?>> documents;
  final bool isLoading;
  final String errorMessage;

  const DrugPageState({
    required this.documents,
    required this.isLoading,
    required this.errorMessage,
  });
}
