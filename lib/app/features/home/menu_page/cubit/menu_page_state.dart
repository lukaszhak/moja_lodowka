part of 'menu_page_cubit.dart';

@immutable
class MenuPageState {
  final List<QueryDocumentSnapshot<Object?>> documents;
  final bool isLoading;
  final String errorMessage;
  const MenuPageState({
    required this.documents,
    required this.isLoading,
    required this.errorMessage,
    
  });
}
