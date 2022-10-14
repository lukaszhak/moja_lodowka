import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:moja_lodowka/app/features/home/pages/candy_page/data_source/candy_remote_data_source.dart';
import 'package:moja_lodowka/app/features/home/pages/candy_page/model/candy_document_model.dart';

class CandyDocumentsRepository {
  final CandyRemoteDataSource _candyRemoteDataSource;

  CandyDocumentsRepository(this._candyRemoteDataSource);

  Stream<List<CandyDocumentModel>> getDocumentsStream() {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      throw Exception('Użytkownik niezalogowany');
    }
    return _candyRemoteDataSource.getDocumentsData().map((querysnapshot) {
      return querysnapshot.docs.map((doc) {
        return CandyDocumentModel(
            id: doc.id,
            title: doc['title'],
            expDate: (doc['expdate'] as Timestamp).toDate());
      }).toList();
    });
  }

  Future<void> add(String title, DateTime expDate) async {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      throw Exception('Użytkownik niezalogowany');
    }
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('slodycze')
        .add({'title': title, 'expdate': expDate});
  }

  Future<void> delete({required String document}) async {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      throw Exception('Użytkownik niezalogowany');
    }
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('slodycze')
        .doc(document)
        .delete();
  }
}
