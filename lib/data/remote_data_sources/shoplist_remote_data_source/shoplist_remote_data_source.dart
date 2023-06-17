// ignore_for_file: deprecated_member_use

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:injectable/injectable.dart';

@injectable
class ShopListRemoteDataSource {
  Stream<QuerySnapshot<Map<String, dynamic>>> getShopListData() {
    try {
      final userID = FirebaseAuth.instance.currentUser?.uid;
      final stream = FirebaseFirestore.instance
          .collection('users')
          .doc(userID)
          .collection('lista')
          .orderBy('title')
          .snapshots();

      if (userID == null) {
        throw Exception('Użytkownik niezalogowany');
      }
      return stream;
    } catch (error) {
      throw Exception(error.toString());
    }
  }

  Future<void> addDoc(String title, bool isChecked) async {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      throw Exception('Użytkownik niezalogowany');
    }
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userID)
          .collection('lista')
          .add({'title': title, 'ischecked': isChecked});
    } catch (error) {
      throw Exception(
        error.toString(),
      );
    }
  }

  Future<void> deleteDoc({required String document}) async {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      throw Exception('Użytkownik niezalogowany');
    }
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userID)
          .collection('lista')
          .doc(document)
          .delete();
    } catch (error) {
      throw Exception(
        error.toString(),
      );
    }
  }

  Future<void> updateValue(
      {required String document, required bool newValue}) async {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userID)
          .collection('lista')
          .doc(document)
          .update({'ischecked': newValue});
    } catch (error) {
      throw Exception(
        error.toString(),
      );
    }
  }

  Future<void> scheduleNotification(DateTime expDate, BuildContext context,
      String? title, int notificationId, {required int days,required String notificationTitle, required String notificationBody}) async {
    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    var scheduleNotificationDateTime = expDate.subtract(
     Duration(days: days),
    );

    AndroidNotificationDetails androidDetails =
        const AndroidNotificationDetails(
            'channel 3', 'medicines', 'channel.discription',
            importance: Importance.high,
            priority: Priority.max,
            icon: '@mipmap/ic_launcher',
            playSound: true);

    NotificationDetails notificationDetails =
        NotificationDetails(android: androidDetails);

    try {
      await flutterLocalNotificationsPlugin.schedule(
          notificationId,
          notificationTitle,
          notificationBody,
          scheduleNotificationDateTime,
          notificationDetails,
          androidAllowWhileIdle: true);
    } catch (error) {
      throw Exception(
        error.toString(),
      );
    }
  }

  Future<void> moveItemToDrugPage(String title, DateTime expDate,
      int notificationId, String document, BuildContext context) async {
    final userID = FirebaseAuth.instance.currentUser?.uid;

    await FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('leki')
        .add({
      'title': title,
      'expdate': expDate,
      'notificationid': notificationId
    });
    if (context.mounted) {
      await scheduleNotification(expDate, context, title, notificationId, days: 15,
          notificationTitle: '${AppLocalizations.of(context)!.reminderIn} ${AppLocalizations.of(context)!.medications}',
          notificationBody: '${AppLocalizations.of(context)!.medicineAboutToExpire} $title');
    }

    await FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('lista')
        .doc(document)
        .delete();
  }
  Future<void> moveItemToDrinkPage(String title, DateTime expDate,
      int notificationId, String document, BuildContext context) async {
    final userID = FirebaseAuth.instance.currentUser?.uid;

    await FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('napoje')
        .add({
      'title': title,
      'expdate': expDate,
      'notificationid': notificationId
    });
    if (context.mounted) {
      await scheduleNotification(expDate, context, title, notificationId, days: 4,
          notificationTitle: '${AppLocalizations.of(context)!.reminderIn} ${AppLocalizations.of(context)!.drinks}',
          notificationBody: '${AppLocalizations.of(context)!.aboutToExpire} $title');
    }

    await FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('lista')
        .doc(document)
        .delete();
  }
  Future<void> moveItemToLongDatePage(String title, DateTime expDate,
      int notificationId, String document, BuildContext context) async {
    final userID = FirebaseAuth.instance.currentUser?.uid;

    await FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('data')
        .add({
      'title': title,
      'expdate': expDate,
      'notificationid': notificationId
    });
    if (context.mounted) {
      await scheduleNotification(expDate, context, title, notificationId, days: 4,
          notificationTitle: '${AppLocalizations.of(context)!.reminderIn} ${AppLocalizations.of(context)!.longTerm}',
          notificationBody: '${AppLocalizations.of(context)!.aboutToExpire} $title');
    }

    await FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('lista')
        .doc(document)
        .delete();
  }
  Future<void> moveItemToFridgePage(String title, DateTime expDate,
      int notificationId, String document, BuildContext context) async {
    final userID = FirebaseAuth.instance.currentUser?.uid;

    await FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('lodowka')
        .add({
      'title': title,
      'expdate': expDate,
      'notificationid': notificationId
    });
    if (context.mounted) {
      await scheduleNotification(expDate, context, title, notificationId, days: 4,
          notificationTitle: '${AppLocalizations.of(context)!.reminderIn} ${AppLocalizations.of(context)!.fridge}',
          notificationBody: '${AppLocalizations.of(context)!.aboutToExpire} $title');
    }

    await FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('lista')
        .doc(document)
        .delete();
  }
  Future<void> moveItemToCandyPage(String title, DateTime expDate,
      int notificationId, String document, BuildContext context) async {
    final userID = FirebaseAuth.instance.currentUser?.uid;

    await FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('slodycze')
        .add({
      'title': title,
      'expdate': expDate,
      'notificationid': notificationId
    });
    if (context.mounted) {
      await scheduleNotification(expDate, context, title, notificationId, days: 4,
          notificationTitle: '${AppLocalizations.of(context)!.reminderIn} ${AppLocalizations.of(context)!.candys}',
          notificationBody: '${AppLocalizations.of(context)!.aboutToExpire} $title');
    }

    await FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('lista')
        .doc(document)
        .delete();
  }
}
