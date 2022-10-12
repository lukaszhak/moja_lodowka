import 'package:intl/intl.dart';

class FridgeDocumentModel {
  FridgeDocumentModel({
    required this.id,
    required this.title,
    required this.expDate,
  });
  final String id;
  final String title;
  final DateTime expDate;

  String expDateFormated() {
    return DateFormat.yMd().format(expDate);
  }

  String daysLeft() {
    return expDate.difference(DateTime.now()).inDays.toString();
  }

  String closeCall() {
    return 7.toString();
  }

  String nearlyOutDate() {
    return 3.toString();
  }

  String outDated() {
    return 0.toString();
  }
}
