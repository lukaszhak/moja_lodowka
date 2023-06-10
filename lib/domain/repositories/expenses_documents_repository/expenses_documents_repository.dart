import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:moja_lodowka/data/remote_data_sources/expenses_remote_data_source/expenses_remote_data_source.dart';
import 'package:moja_lodowka/domain/models/expenses_document_model/expenses_document_model.dart';

class ExpensesDocumentsRepository {
  final ExpensesRemoteDataSource _expensesRemoteDataSource;

  ExpensesDocumentsRepository(this._expensesRemoteDataSource);

  Stream<List<ExpensesDocumentModel>> getExpensesDocuments() {
    return _expensesRemoteDataSource.getExpensesData().map((querysnapshot) {
      return querysnapshot.docs.map((doc) {
        return ExpensesDocumentModel(
          id: doc.id,
          title: doc['title'],
          category: doc['category'],
          amount: doc['amount'],
          expensesDate: (doc['expenses_date'] as Timestamp).toDate(),
        );
      }).toList();
    });
  }

  Future<void> addDocument(String title, String category, num amount, DateTime expensesDate) async {
    _expensesRemoteDataSource.addDoc(title, category, amount, expensesDate);
  }

  Future<void> deleteDocument({required String document}) async {
    _expensesRemoteDataSource.deleteDoc(document: document);
  }
}
