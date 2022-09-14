import 'package:intl/intl.dart';

class CategoryModel {
  CategoryModel({required this.expDate});

  final DateTime expDate;

  String expDateFormated() {
    return DateFormat.yMMM().format(expDate);
  }
}
