import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:moja_lodowka/app/features/home/pages/drug_page/data_source/drug_remote_data_source.dart';
import 'package:moja_lodowka/app/features/home/pages/drug_page/model/drug_document_model.dart';

class DrugDocumentsRepository {
  final DrugRemoteDataSource _drugRemoteDataSource;

  DrugDocumentsRepository(this._drugRemoteDataSource);

  Stream<List<DrugDocumentModel>> getDrugsDocuments() {
    return _drugRemoteDataSource.getDrugsData().map((querySnapshot) {
      return querySnapshot.docs.map((doc) {
        return DrugDocumentModel(
            id: doc.id,
            title: doc['title'],
            expDate: (doc['expdate'] as Timestamp).toDate());
      }).toList();
    });
  }

  Future<void> add(String title, DateTime expDate) async {
    await _drugRemoteDataSource.addDoc(title, expDate);
  }

  Future<void> delete({required String document}) async {
    await _drugRemoteDataSource.deleteDoc(document: document);
  }
}
