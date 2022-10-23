import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
part 'drug_document_model.freezed.dart';

@freezed
class DrugDocumentModel with _$DrugDocumentModel {
  const DrugDocumentModel._();
  factory DrugDocumentModel({
    required String id,
    required String title,
    required DateTime expDate,
  }) = _DrugDocumentModel;

  String expDateFormated() {
    return DateFormat.yM().format(expDate);
  }

  int daysToExpire() {
    return expDate.difference(DateTime.now()).inDays;
  }

  int closeCall() {
    return (30);
  }

  int outDated() {
    return (0);
  }
}
