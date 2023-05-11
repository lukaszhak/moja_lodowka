import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:moja_lodowka/data/remote_data_sources/drink_remote_data_source/drink_remote_data_source.dart';
import 'package:moja_lodowka/domain/models/drink_document_model/drink_document_model.dart';

@injectable
class DrinkDocumentsRepository {
  final DrinkRemoteDataSource _drinkRemoteDataSource;

  DrinkDocumentsRepository(this._drinkRemoteDataSource);

  Stream<List<DrinkDocumentModel>> getDrinksDocuments() {
    return _drinkRemoteDataSource.getDrinksData().map((querySnapshot) {
      return querySnapshot.docs.map((doc) {
        return DrinkDocumentModel(
            id: doc.id,
            title: doc['title'],
            expDate: (doc['expdate'] as Timestamp).toDate());
      }).toList();
    });
  }

  Future<void> add(String title, DateTime expDate) async {
    await _drinkRemoteDataSource.addDoc(title, expDate);
  }

  Future<void> delete({required String document}) async {
    await _drinkRemoteDataSource.deleteDoc(document: document);
  }

  Future<void> notification(DateTime expDate, BuildContext context,
      String? title, int notificationId) async {
    await _drinkRemoteDataSource.scheduleNotification(
        expDate, context, title, notificationId);
  }

  Future<void> cancelNotification(int notificationId) async {
    await _drinkRemoteDataSource.cancelNotification(notificationId);
  }
}
