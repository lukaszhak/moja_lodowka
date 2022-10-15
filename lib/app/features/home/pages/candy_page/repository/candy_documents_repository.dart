import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:moja_lodowka/app/features/home/pages/candy_page/data_source/candy_remote_data_source.dart';
import 'package:moja_lodowka/app/features/home/pages/candy_page/model/candy_document_model.dart';

class CandyDocumentsRepository {
  final CandyRemoteDataSource _candyRemoteDataSource;

  CandyDocumentsRepository(this._candyRemoteDataSource);

  Stream<List<CandyDocumentModel>> getCandysDocuments() {
    return _candyRemoteDataSource.getCandysData().map((querysnapshot) {
      return querysnapshot.docs.map((doc) {
        return CandyDocumentModel(
            id: doc.id,
            title: doc['title'],
            expDate: (doc['expdate'] as Timestamp).toDate());
      }).toList();
    });
  }

  Future<void> add(String title, DateTime expDate) async {
    await _candyRemoteDataSource.addDoc(title, expDate);
  }

  Future<void> delete({required String document}) async {
    await _candyRemoteDataSource.deleteDoc(document: document);
  }
}
