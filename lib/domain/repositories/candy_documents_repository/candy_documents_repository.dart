import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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
            notificationId: doc['notificationid'],
            expDate: (doc['expdate'] as Timestamp).toDate());
            
      }).toList();
    });
  }

  Future<void> addDocument(String title, DateTime expDate, int notificationId) async {
    await _candyRemoteDataSource.addDoc(title, expDate, notificationId);
  }

  Future<void> deleteDocument({required String document}) async {
    await _candyRemoteDataSource.deleteDoc(document: document);
  }

  Future<void> addNotification(DateTime expDate, BuildContext context,
      String? title, int notificationId) async {
    await _candyRemoteDataSource.scheduleNotification(
        expDate, context, title, notificationId);
  }

  Future<void> cancelNotification(int notificationId) async {
    await _candyRemoteDataSource.cancelNotification(notificationId);
  }
}
