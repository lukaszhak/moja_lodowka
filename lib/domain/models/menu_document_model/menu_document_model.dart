import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'menu_document_model.freezed.dart';

@freezed
class MenuDocumentModel with _$MenuDocumentModel {
  const MenuDocumentModel._();
  factory MenuDocumentModel({
    required String id,
    required String title,
    required String content,
    required QueryDocumentSnapshot document,
  }) = _MenuDocumentModel;
}
