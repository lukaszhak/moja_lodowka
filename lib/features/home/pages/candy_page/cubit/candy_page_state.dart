part of 'candy_page_cubit.dart';

@freezed
class CandyPageState with _$CandyPageState {
  factory CandyPageState({
    required List<CandyDocumentModel> documents,
    required Status status,
    required String? errorMessage,
    int? notificationId,
    String? title,
    DateTime? expDate
  }) = _CandyPageState;
}
