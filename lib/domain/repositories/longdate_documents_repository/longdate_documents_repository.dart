import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:moja_lodowka/data/remote_data_sources/longdate_remote_data_source/longdate_remote_data_source.dart';
import 'package:moja_lodowka/domain/models/longdate_document_model/longdate_document_model.dart';

@injectable
class LongDateDocumentsRepository {
  final LongDateRemoteDataSource _longDateRemoteDataSource;

  LongDateDocumentsRepository(this._longDateRemoteDataSource);

  Stream<List<LongDateDocumentModel>> getLongDateDocuments() {
    return _longDateRemoteDataSource.getLongDateData().map((querySnapshot) {
      return querySnapshot.docs.map((doc) {
        return LongDateDocumentModel(
            notificationId: doc['notificationid'],
            id: doc.id,
            title: doc['title'],
            expDate: (doc['expdate'] as Timestamp).toDate());
      }).toList();
    });
  }

  Future<void> addDocument(String title, DateTime expDate, int notificationId) async {
    await _longDateRemoteDataSource.addDoc(title, expDate, notificationId);
  }

  Future<void> deleteDocument({required String document}) async {
    await _longDateRemoteDataSource.deleteDoc(document: document);
  }

  Future<void> addNotification(DateTime expDate, BuildContext context, String? title, int notificationId) async {
    await _longDateRemoteDataSource.scheduleNotification(
        expDate, context, title, notificationId);
  }

  Future<void> cancelNotification(int notificationId) async {
    await _longDateRemoteDataSource.cancelNotification(notificationId);
  }
}
