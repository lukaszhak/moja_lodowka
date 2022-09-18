import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:moja_lodowka/app/features/home/drink_page/model/drink_document_model.dart';

class DrinkDocumentsRepository {
  Stream<List<DrinkDocumentModel>> getDocumentsStream() {
    return FirebaseFirestore.instance
        .collection('napoje')
        .orderBy('title')
        .snapshots()
        .map((querySnapshot) {
      return querySnapshot.docs.map((doc) {
        return DrinkDocumentModel(
            id: doc.id,
            title: doc['title'],
            expDate: (doc['expdate'] as Timestamp).toDate());
      }).toList();
    });
  }
}
