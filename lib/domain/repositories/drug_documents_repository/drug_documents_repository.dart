import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:moja_lodowka/data/remote_data_sources/drug_remote_data_source/drug_remote_data_source.dart';
import 'package:moja_lodowka/domain/models/drug_document_model/drug_document_model.dart';

@injectable
class DrugDocumentsRepository {
  final DrugRemoteDataSource _drugRemoteDataSource;

  DrugDocumentsRepository(this._drugRemoteDataSource);

  Stream<List<DrugDocumentModel>> getDrugsDocuments() {
    return _drugRemoteDataSource.getDrugsData().map((querySnapshot) {
      return querySnapshot.docs.map((doc) {
        return DrugDocumentModel(
            notificationId: doc['notificationid'],
            id: doc.id,
            title: doc['title'],
            expDate: (doc['expdate'] as Timestamp).toDate());
      }).toList();
    });
  }

  Future<void> add(String title, DateTime expDate, int notificationId) async {
    await _drugRemoteDataSource.addDoc(title, expDate, notificationId);
  }

  Future<void> delete({required String document}) async {
    await _drugRemoteDataSource.deleteDoc(document: document);
  }

  Future<void> notification(DateTime expDate, BuildContext context,
      String? title, int notificationId) async {
    await _drugRemoteDataSource.scheduleNotification(
        expDate, context, title, notificationId);
  }

  Future<void> cancelNotification(int notificationId) async {
    await _drugRemoteDataSource.cancelNotification(notificationId);
  }
}
