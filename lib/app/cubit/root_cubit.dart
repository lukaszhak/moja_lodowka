import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:moja_lodowka/domain/models/user_model/user_model.dart';
import 'package:moja_lodowka/domain/repositories/root_repository/root_repository.dart';

part 'root_state.dart';
part 'root_cubit.freezed.dart';

@injectable
class RootCubit extends Cubit<RootState> {
  RootCubit(this._rootRepository)
      : super(
          RootState(
            user: null,
            isLoading: false,
            errorMessage: '',
            obscureText: true,
            isCreatingAccount: false,
          ),
        );

  final RootRepository _rootRepository;

  StreamSubscription? _streamSubscription;

  Future<void> isCreatingAccount(bool isCreatingAccount) async {
    emit(state.copyWith(isCreatingAccount: !isCreatingAccount));
  }

  Future<void> obscureText(bool obscureText) async {
    emit(state.copyWith(obscureText: !obscureText));
  }

  Future<void> showErrorMessage(String errorMessage) async {
    emit(
      state.copyWith(errorMessage: errorMessage),
    );
  }

  Future<void> createAccount({
    required String email,
    required String password,
  }) async {
    await _rootRepository.createAccount(email, password);
  }

  Future<void> deleteAccount() async {
    await _rootRepository.deleteAccount();
  }

  Future<void> logIn({
    required String email,
    required String password,
  }) async {
    await _rootRepository.logIn(email, password);
  }

  Future<void> signOut() async {
    await _rootRepository.logOut();
  }

  Future<void> start() async {
    emit(
      RootState(
        user: null,
        isLoading: true,
        errorMessage: '',
        obscureText: true,
        isCreatingAccount: false,
      ),
    );
    try {
      _streamSubscription = _rootRepository.getUser().listen((user) {
        emit(
          RootState(
            user: user,
            isLoading: false,
            errorMessage: '',
            obscureText: true,
            isCreatingAccount: false,
          ),
        );
      });
    } catch (error) {
      emit(
        RootState(
          user: null,
          isLoading: false,
          errorMessage: error.toString(),
          obscureText: true,
          isCreatingAccount: false,
        ),
      );
    }
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
