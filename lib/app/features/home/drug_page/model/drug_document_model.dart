import 'package:intl/intl.dart';

class DrugDocumentModel {
  DrugDocumentModel({
    required this.id,
    required this.title,
    required this.expDate,
  });

  final String id;
  final String title;
  final DateTime expDate;

  String expDateFormated() {
    return DateFormat.yMMM().format(expDate);
  }
}
