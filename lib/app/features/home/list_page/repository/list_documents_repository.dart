import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:moja_lodowka/app/features/home/list_page/model/list_document_model.dart';

class ListDocumentsRepository {
  Stream<List<ListDocumentModel>> getDocumentsStream() {
    return FirebaseFirestore.instance
        .collection('lista')
        .orderBy('title')
        .snapshots()
        .map((querySnapshot) {
      return querySnapshot.docs.map((doc) {
        return ListDocumentModel(id: doc.id, title: doc['title']);
      }).toList();
    });
  }

  Future<void> add(String title) async {
    await FirebaseFirestore.instance.collection('lista').add({'title': title});
  }

  Future<void> delete({required String document}) async {
    await FirebaseFirestore.instance.collection('lista').doc(document).delete();
  }
}
