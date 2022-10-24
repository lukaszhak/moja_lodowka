part of 'longdate_page_cubit.dart';

@freezed
class LongDatePageState with _$LongDatePageState {
  factory LongDatePageState({
    required List<LongDateDocumentModel> documents,
    required Status status,
    required String? errorMessage,
  }) = _LongDatePageState;
}

