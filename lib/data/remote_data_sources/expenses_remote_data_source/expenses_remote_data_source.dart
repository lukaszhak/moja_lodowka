import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ExpensesRemoteDataSource {
  Stream<QuerySnapshot<Map<String, dynamic>>> getExpensesData() {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    final stream = FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('expenses')
        .orderBy('title')
        .snapshots();

    try {
      if (userID == null) {
        throw Exception('Użytkownik niezalogowany');
      }
      return stream;
    } catch (error) {
      throw Exception(
        error.toString(),
      );
    }
  }
}
