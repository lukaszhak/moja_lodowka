import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:moja_lodowka/app/features/home/menu_page/model/menu_document_model.dart';

class MenuDocumentsRepository {
  Stream<List<MenuDocumentModel>> getDocumentsStream() {
    return FirebaseFirestore.instance
        .collection('przepisy')
        .orderBy('title')
        .snapshots()
        .map((querySnapshot) {
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
    await FirebaseFirestore.instance
        .collection('przepisy')
        .add({'title': title, 'content': content});
  }

  Future<void> delete({required String document}) async {
    await FirebaseFirestore.instance
        .collection('przepisy')
        .doc(document)
        .delete();
  }

  Future<void> update(String content, String document) async {
    await FirebaseFirestore.instance
        .collection('przepisy')
        .doc(document)
        .update({'content': content});
  }
}
