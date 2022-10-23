import 'package:freezed_annotation/freezed_annotation.dart';

part 'list_document_model.freezed.dart';

@freezed
class ListDocumentModel with _$ListDocumentModel {
  const ListDocumentModel._();
  factory ListDocumentModel({
    required String id,
    required String title,
  }) = _ListDocumentModel;
}
