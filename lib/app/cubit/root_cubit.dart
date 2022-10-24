import 'dart:async';

import 'package:bloc/bloc.dart';
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
          ),
        );

  final RootRepository _rootRepository;

  StreamSubscription? _streamSubscription;

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
      ),
    );
    _streamSubscription = _rootRepository.getUser().listen((user) {
      emit(
        RootState(
          user: user,
          isLoading: false,
          errorMessage: '',
        ),
      );
    })
      ..onError((error) {
        emit(
          RootState(
            user: null,
            isLoading: false,
            errorMessage: error.toString(),
          ),
        );
      });
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
