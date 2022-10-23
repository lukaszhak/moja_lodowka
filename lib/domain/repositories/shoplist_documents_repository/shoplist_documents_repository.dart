


import 'package:moja_lodowka/data/remote_data_sources/shoplist_remote_data_source/shoplist_remote_data_source.dart';
import 'package:moja_lodowka/domain/models/shoplist_document_model/shoplist_document_model.dart';


class ShopListDocumentsRepository {
  final ShopListRemoteDataSource _listRemoteDataSource;

  ShopListDocumentsRepository(this._listRemoteDataSource);

  Stream<List<ShopListDocumentModel>> getShopListDocuments() {
    return _listRemoteDataSource.getShopListData().map((querySnapshot) {
      return querySnapshot.docs.map((doc) {
        return ShopListDocumentModel(id: doc.id, title: doc['title']);
      }).toList();
    });
  }

  Future<void> add(String title) async {
    await _listRemoteDataSource.addDoc(title);
  }

  Future<void> delete({required String document}) async {
    await _listRemoteDataSource.deleteDoc(document: document);
  }
}
