import 'package:freezed_annotation/freezed_annotation.dart';

part 'shoplist_document_model.freezed.dart';

@freezed
class ShopListDocumentModel with _$ShopListDocumentModel {
  const ShopListDocumentModel._();
  factory ShopListDocumentModel({
    required String id,
    required String title,
  }) = _ShopListDocumentModel;
}
