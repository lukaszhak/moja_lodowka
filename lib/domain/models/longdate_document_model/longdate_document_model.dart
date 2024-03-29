import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'longdate_document_model.freezed.dart';

@freezed
class LongDateDocumentModel with _$LongDateDocumentModel {
  const LongDateDocumentModel._();
  factory LongDateDocumentModel({
    required String id,
    required String title,
    required DateTime expDate,
    required int notificationId,
  }) = _LongDateDocumentModel;

  String expDateFormated() {
    return DateFormat('dd.MM.yyyy').format(expDate);
  }

  int daysToExpire() {
    return expDate.difference(DateTime.now()).inDays;
  }

  int closeCall() {
    return (3);
  }

  int outDated() {
    return (0);
  }
}
