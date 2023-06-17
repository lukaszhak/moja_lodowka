import 'package:intl/intl.dart';

class ExpensesDocumentModel {
  ExpensesDocumentModel(
      {required this.category,
      required this.amount,
      required this.id,
      required this.title,
      required this.expensesDate});

  final String id, title, category;
  final DateTime expensesDate;
  final num amount;

  String expensesDateFormated() {
    return DateFormat('dd.MM.yyyy').format(expensesDate);
  }
}
