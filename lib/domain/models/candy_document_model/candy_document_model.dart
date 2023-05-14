import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'candy_document_model.freezed.dart';

@freezed
class CandyDocumentModel with _$CandyDocumentModel {
  const CandyDocumentModel._();
  factory CandyDocumentModel({
    required String id,
    required String title,
    required DateTime expDate,
    required int notificationId,
  }) = _CandyDocumentModel;

  String expDateFormated() {
    return DateFormat.yMd().format(expDate);
  }

  int daysToExpire() {
    return expDate.difference(DateTime.now()).inDays;
  }

  int closeCall() {
    return (6);
  }

  int outDated() {
    return (0);
  }
}
