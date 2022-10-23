import 'package:moja_lodowka/data/remote_data_sources/menu_remote_data_source/menu_remote_data_source.dart';
import 'package:moja_lodowka/domain/models/menu_document_model/menu_document_model.dart';

class MenuDocumentsRepository {
  final MenuRemoteDataSource _menuRemoteDataSource;

  MenuDocumentsRepository(this._menuRemoteDataSource);

  Stream<List<MenuDocumentModel>> getMenuDocuments() {
    return _menuRemoteDataSource.getMenuData().map((querySnapshot) {
      return querySnapshot.docs.map((doc) {
        return MenuDocumentModel(
            id: doc.id,
            title: doc['title'],
            document: doc,
            content: doc['content']);
      }).toList();
    });
  }

  Future<void> add(String title, String content) async {
    await _menuRemoteDataSource.addDoc(title, content);
  }

  Future<void> delete({required String document}) async {
    await _menuRemoteDataSource.deleteDoc(document: document);
  }

  Future<void> update(String content, String document) async {
    await _menuRemoteDataSource.updateDoc(content, document);
  }
}
