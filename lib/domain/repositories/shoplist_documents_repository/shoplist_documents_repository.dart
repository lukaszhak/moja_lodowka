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

  Future<void> add(String title, bool isChecked) async {
    await _listRemoteDataSource.addDoc(title, isChecked);
  }

  Future<void> delete({required String document}) async {
    await _listRemoteDataSource.deleteDoc(document: document);
  }

  Future<void> update(String document, bool newValue) async {
    await _listRemoteDataSource.updateValue(
        document: document, newValue: newValue);
  }
}
