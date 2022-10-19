

import 'package:moja_lodowka/data/remote_data_sources/list_remote_data_source/list_remote_data_source.dart';
import 'package:moja_lodowka/domain/models/list_document_model/list_document_model.dart';

class ListDocumentsRepository {
  final ListRemoteDataSource _listRemoteDataSource;

  ListDocumentsRepository(this._listRemoteDataSource);

  Stream<List<ListDocumentModel>> getShopListDocuments() {
    return _listRemoteDataSource.getShopListData().map((querySnapshot) {
      return querySnapshot.docs.map((doc) {
        return ListDocumentModel(id: doc.id, title: doc['title']);
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
