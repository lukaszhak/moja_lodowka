import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@injectable 
class RootRemoteDataSource {
  Stream<User?> getUserData() {
    return FirebaseAuth.instance.authStateChanges();
  }

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
