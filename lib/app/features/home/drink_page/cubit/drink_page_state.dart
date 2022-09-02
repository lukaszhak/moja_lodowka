part of 'drink_page_cubit.dart';

@immutable
class DrinkPageState {
  final List<QueryDocumentSnapshot<Object?>> documents;
  final bool isLoading;
  final String errorMessage;

  const DrinkPageState({
    required this.documents,
    required this.isLoading,
    required this.errorMessage,
  });
}
