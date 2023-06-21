import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'expenses_document_model.freezed.dart';

@freezed
class ExpensesDocumentModel with _$ExpensesDocumentModel {
  const ExpensesDocumentModel._();
  factory ExpensesDocumentModel(
      {required String category,
      required num amount,
      required String id,
      required String title,
      required DateTime expensesDate,}) = _ExpensesDocumentModel;


  String expensesDateFormated() {
    return DateFormat('dd.MM.yyyy').format(expensesDate);
  }
}
