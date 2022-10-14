import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CandyRemoteDataSource {
  Stream<QuerySnapshot<Map<String, dynamic>>> getDocumentsData()  {

    final userID = FirebaseAuth.instance.currentUser?.uid;
    
    return FirebaseFirestore.instance
        .collection('users')
        .doc(userID)
        .collection('slodycze')
        .orderBy('title')
        .snapshots();
  }
}
