import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:moja_lodowka/app/features/home/longdate_page/model/longdate_document_model.dart';

class LongDateDocumentsRepository {
  Stream<List<LongDateDocumentModel>> getDocumentsStream() {
    return FirebaseFirestore.instance
        .collection('data')
        .orderBy('title')
        .snapshots()
        .map((querySnapshot) {
      return querySnapshot.docs.map((doc) {
        return LongDateDocumentModel(
            id: doc.id,
            title: doc['title'],
            expDate: (doc['expdate'] as Timestamp).toDate());
      }).toList();
    });
  }
}
