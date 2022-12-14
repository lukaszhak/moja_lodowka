import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
part 'fridge_document_model.freezed.dart';

@freezed
class FridgeDocumentModel with _$FridgeDocumentModel {
  const FridgeDocumentModel._();
  factory FridgeDocumentModel({
    required String id,
    required String title,
    required DateTime expDate,
  }) = _FridgeDocumentModel;

  String expDateFormated() {
    return DateFormat.yMd().format(expDate);
  }

  int daysToExpire() {
    return expDate.difference(DateTime.now()).inDays;
  }

  int closeCall() {
    return (7);
  }

  int outDated() {
    return (0);
  }
}
