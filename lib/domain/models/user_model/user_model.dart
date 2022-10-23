import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';

@freezed
class UserModel with _$UserModel {
  const UserModel._();
  factory UserModel({
    required User? user,
  }) = _UserModel;

  String? get email {
    return user?.email;
  }
}
