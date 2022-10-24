import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:moja_lodowka/data/remote_data_sources/fridge_remote_data_source/fridge_remote_data_source.dart';
import 'package:moja_lodowka/domain/models/fridge_document_model/fridge_document_model.dart';

@injectable 
class FridgeDocumentsRepository {
  final FridgeRemoteDataSource _fridgeRemoteDataSource;

  FridgeDocumentsRepository(this._fridgeRemoteDataSource);

  Stream<List<FridgeDocumentModel>> getFridgeDocuments() {
    return _fridgeRemoteDataSource.getFridgeData().map((querySnapshot) {
      return querySnapshot.docs.map((doc) {
        return FridgeDocumentModel(
          id: doc.id,
          title: doc['title'],
          expDate: (doc['expdate'] as Timestamp).toDate(),
        );
      }).toList();
    });
  }

  Future<void> add(String title, DateTime expDate) async {
    await _fridgeRemoteDataSource.addDoc(title, expDate);
  }

  Future<void> delete({required String document}) async {
    await _fridgeRemoteDataSource.deleteDoc(document: document);
  }
}
