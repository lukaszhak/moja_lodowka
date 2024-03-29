part of 'drug_page_cubit.dart';

@freezed
class DrugPageState with _$DrugPageState {
  factory DrugPageState({
    required List<DrugDocumentModel> documents,
    required Status status,
    required String? errorMessage,
    int? notificationId,
    String? title,
    DateTime? expDate
  }) = _DrugPageState;
}
