part of 'longdate_page_cubit.dart';

@freezed
class LongDatePageState with _$LongDatePageState {
  factory LongDatePageState({
    required List<LongDateDocumentModel> documents,
    required Status status,
    required String? errorMessage,
    int? notificationId,
    String? title,
    DateTime? expDate
  }) = _LongDatePageState;
}

