import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:moja_lodowka/app/features/home/pages/menu_page/model/menu_document_model.dart';

class MenuDocumentsRepository {
  Stream<List<MenuDocumentModel>> getDocumentsStream() {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      throw Exception('Użytkownik niezalogowany');
    }
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
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
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      throw Exception('Użytkownik niezalogowany');
    }
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('przepisy')
        .add({'title': title, 'content': content});
  }

  Future<void> delete({required String document}) async {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      throw Exception('Użytkownik niezalogowany');
    }
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('przepisy')
        .doc(document)
        .delete();
  }

  Future<void> update(String content, String document) async {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      throw Exception('Użytkownik niezalogowany');
    }
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('przepisy')
        .doc(document)
        .update({'content': content});
  }
}
