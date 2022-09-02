part of 'fridge_page_cubit.dart';

@immutable
class FridgePageState {
  final List<QueryDocumentSnapshot<Object?>> documents;
  final bool isLoading;
  final String errorMessage;

  const FridgePageState(
      {required this.documents,
      required this.isLoading,
      required this.errorMessage});
}
