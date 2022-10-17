import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  final User? user;

  UserModel({required this.user});

  String? get email {
      return user?.email;
    
  }
}
