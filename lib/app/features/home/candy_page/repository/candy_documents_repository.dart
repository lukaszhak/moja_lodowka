import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:moja_lodowka/app/features/home/candy_page/model/candy_document_model.dart';

class CandyDocumentsRepository {
  Stream<List<CandyDocumentModel>> getDocumentsStream() {
    return FirebaseFirestore.instance
        .collection('slodycze')
        .orderBy('title')
        .snapshots()
        .map((querySnapshot) {
      return querySnapshot.docs.map((doc) {
        return CandyDocumentModel(
            id: doc.id,
            title: doc['title'],
            expDate: (doc['expdate'] as Timestamp).toDate());
      }).toList();
    });
  }

  Future<void> add(String title, DateTime expDate) async {
    await FirebaseFirestore.instance
        .collection('slodycze')
        .add({'title': title, 'expdate': expDate});
  }

  Future<void> delete({required String document}) async {
    await FirebaseFirestore.instance
        .collection('slodycze')
        .doc(document)
        .delete();
  }
}
