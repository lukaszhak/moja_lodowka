import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:moja_lodowka/data/remote_data_sources/shoplist_remote_data_source/shoplist_remote_data_source.dart';
import 'package:moja_lodowka/domain/models/shoplist_document_model/shoplist_document_model.dart';

@injectable
class ShopListDocumentsRepository {
  final ShopListRemoteDataSource _listRemoteDataSource;

  ShopListDocumentsRepository(this._listRemoteDataSource);

  Stream<List<ShopListDocumentModel>> getShopListDocuments() {
    return _listRemoteDataSource.getShopListData().map((querySnapshot) {
      return querySnapshot.docs.map((doc) {
        return ShopListDocumentModel(
            id: doc.id, title: doc['title'], isChecked: doc['ischecked']);
      }).toList();
    });
  }

  Future<void> addDocument(String title, bool isChecked) async {
    await _listRemoteDataSource.addDoc(title, isChecked);
  }

  Future<void> deleteDocument({required String document}) async {
    await _listRemoteDataSource.deleteDoc(document: document);
  }

  Future<void> updateValue(String document, bool newValue) async {
    await _listRemoteDataSource.updateValue(
        document: document, newValue: newValue);
  }

  Future<void> moveItemToDrugPage(String title, DateTime expDate, String document, int notificationId, BuildContext context) async {
    await _listRemoteDataSource.moveItemToDrugPage(title, expDate, notificationId, document, context);
  }
  Future<void> moveItemToDrinkPage(String title, DateTime expDate, String document, int notificationId, BuildContext context) async {
    await _listRemoteDataSource.moveItemToDrinkPage(title, expDate, notificationId, document, context);
  }
  Future<void> moveItemToLongDatePage(String title, DateTime expDate, String document, int notificationId, BuildContext context) async {
    await _listRemoteDataSource.moveItemToLongDatePage(title, expDate, notificationId, document, context);
  }
  Future<void> moveItemToFridgePage(String title, DateTime expDate, String document, int notificationId, BuildContext context) async {
    await _listRemoteDataSource.moveItemToFridgePage(title, expDate, notificationId, document, context);
  }
  Future<void> moveItemToCandyPage(String title, DateTime expDate, String document, int notificationId, BuildContext context) async {
    await _listRemoteDataSource.moveItemToCandyPage(title, expDate, notificationId, document, context);
  }
}
