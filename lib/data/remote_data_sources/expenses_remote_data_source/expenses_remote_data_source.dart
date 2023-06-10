import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@injectable
class ExpensesRemoteDataSource {
  Stream<QuerySnapshot<Map<String, dynamic>>> getExpensesData() {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    final stream = FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('expenses')
        .orderBy('expenses_date')
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

  Future<void> addDoc(
      String title, String category, num amount, DateTime expensesDate) async {
    final userID = FirebaseAuth.instance.currentUser?.uid;
    if (userID == null) {
      throw Exception('Użytkownik niezalogowany');
    }
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userID)
          .collection('expenses')
          .add(
        {
          'title': title,
          'category': category,
          'amount': amount,
          'expenses_date': expensesDate
        },
      );
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
          .collection('expenses')
          .doc(document)
          .delete();
    } catch (error) {
      throw Exception(
        error.toString(),
      );
    }
  }
}
