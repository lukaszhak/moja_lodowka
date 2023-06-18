part of 'root_cubit.dart';

@freezed
class RootState with _$RootState {
  factory RootState({
    required UserModel? user,
    required bool isLoading,
    required String errorMessage,
    required bool obscureText,
    required bool isCreatingAccount,
  }) = _RootState;
}
