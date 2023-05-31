import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
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
          notificationId: doc['notificationid'],
          id: doc.id,
          title: doc['title'],
          expDate: (doc['expdate'] as Timestamp).toDate(),
        );
      }).toList();
    });
  }

  Future<void> addDocument(String title, DateTime expDate, int notificationId) async {
    await _fridgeRemoteDataSource.addDoc(title, expDate, notificationId);
  }

  Future<void> deleteDocument({required String document}) async {
    await _fridgeRemoteDataSource.deleteDoc(document: document);
  }

  Future<void> addNotification(DateTime expDate, BuildContext context, String? title, int notificationId) async {
    await _fridgeRemoteDataSource.scheduleNotification(
        expDate, context, title, notificationId);
  }

  Future<void> cancelNotification(int notificationId) async {
    await _fridgeRemoteDataSource.cancelNotification(notificationId);
  }
}
