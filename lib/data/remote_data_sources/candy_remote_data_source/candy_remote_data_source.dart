// ignore_for_file: deprecated_member_use
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:injectable/injectable.dart';

@injectable
class CandyRemoteDataSource {
  Stream<QuerySnapshot<Map<String, dynamic>>> getCandysData() {
    try {
      final userID = FirebaseAuth.instance.currentUser?.uid;
      final stream = FirebaseFirestore.instance
          .collection('users')
          .doc(userID)
          .collection('slodycze')
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

  Future<void> addDoc(
      String title, DateTime expDate, int notificationId) async {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      throw Exception('Użytkownik niezalogowany');
    }
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userID)
          .collection('slodycze')
          .add({
        'title': title,
        'expdate': expDate,
        'notificationid': notificationId
      });
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
          .collection('slodycze')
          .doc(document)
          .delete();
    } catch (error) {
      throw Exception(
        error.toString(),
      );
    }
  }

  Future<void> scheduleNotification(DateTime expDate, BuildContext context,
      String? title, int notificationId) async {
    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    var scheduleNotificationDateTime = expDate.subtract(
      const Duration(days: 7),
    );
    AndroidNotificationDetails androidDetails =
        const AndroidNotificationDetails(
      'channel 1',
      'candys',
      'channel.discription',
      importance: Importance.high,
      priority: Priority.max,
      icon: '@mipmap/ic_launcher',
      playSound: true,
    );
    NotificationDetails notificationDetails =
        NotificationDetails(android: androidDetails);

    try {
      await flutterLocalNotificationsPlugin.schedule(
        notificationId,
        'Przypomnienie w ${AppLocalizations.of(context)!.candys}',
        'Kończy się data ważności produktu $title',
        scheduleNotificationDateTime,
        notificationDetails,
        androidAllowWhileIdle: true,
      );
    } catch (error) {
      throw Exception(
        error.toString(),
      );
    }
  }

  Future<void> cancelNotification(int notificationId) async {
    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();

    try {
      await flutterLocalNotificationsPlugin.cancel(notificationId);
    } catch (error) {
      throw Exception(
        error.toString(),
      );
    }
  }
}
