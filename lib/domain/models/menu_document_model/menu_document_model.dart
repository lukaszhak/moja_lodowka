import 'package:cloud_firestore/cloud_firestore.dart';

class MenuDocumentModel {
  MenuDocumentModel(
      {required this.id,
      required this.title,
      required this.content,
      required this.document});

  final String id;
  final String title;
  final String content;
  final QueryDocumentSnapshot document;

 
}
