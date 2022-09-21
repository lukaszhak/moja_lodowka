import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:moja_lodowka/app/features/home/drug_page/model/drug_document_model.dart';

class DrugDocumentsRepository {
  Stream<List<DrugDocumentModel>> getDocumentsStream() {
    return FirebaseFirestore.instance
        .collection('leki')
        .orderBy('title')
        .snapshots()
        .map((querySnapshot) {
      return querySnapshot.docs.map((doc) {
        return DrugDocumentModel(
            id: doc.id,
            title: doc['title'],
            expDate: (doc['expdate'] as Timestamp).toDate());
      }).toList();
    });
  }

  Future<void> add(String title, DateTime expDate) async {
    await FirebaseFirestore.instance
        .collection('leki')
        .add({'title': title, 'expdate': expDate});
  }

  Future<void> delete({required String document}) async {
    await FirebaseFirestore.instance.collection('leki').doc(document).delete();
  }
}
