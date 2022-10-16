import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:moja_lodowka/app/model/user_model.dart';
import 'package:moja_lodowka/app/root_repository/root_repository.dart';

part 'root_state.dart';

class RootCubit extends Cubit<RootState> {
  RootCubit(this._rootRepository)
      : super(
          const RootState(
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
    _rootRepository.createAccount(email, password);
  }

  Future<void> logIn({
    required String email,
    required String password,
  }) async {
    _rootRepository.logIn(email, password);
  }

  Future<void> signOut() async {
    _rootRepository.logOut();
  }

  Future<void> start() async {
    emit(
      const RootState(
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
