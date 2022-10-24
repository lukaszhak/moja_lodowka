import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:moja_lodowka/data/remote_data_sources/candy_remote_data_source/candy_remote_data_source.dart';
import 'package:moja_lodowka/domain/models/candy_document_model/candy_document_model.dart';

@injectable 
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
