import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:moja_lodowka/app/features/home/fridge_page/model/fridge_document_model.dart';

class FridgeDocumentsRepository {
  Stream<List<FridgeDocumentModel>> getDocumentsStream() {
    return FirebaseFirestore.instance
        .collection('lodowka')
        .orderBy('title')
        .snapshots()
        .map((querySnapshot) {
      return querySnapshot.docs.map((doc) {
        return FridgeDocumentModel(
          id: doc.id,
          title: doc['title'],
          expDate: (doc['expdate'] as Timestamp).toDate(),
        );
      }).toList();
    });
  }
}