import 'package:firebase_auth/firebase_auth.dart';

class RootRepository {
  Future<void> createAccount(String email, String password) async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
  }

  Future<void> logIn(String email, String password) async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> logOut() async {
    await FirebaseAuth.instance.signOut();
  }
}
