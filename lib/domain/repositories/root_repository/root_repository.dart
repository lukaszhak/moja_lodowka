import 'package:injectable/injectable.dart';
import 'package:moja_lodowka/data/remote_data_sources/root_remote_data_source/root_remote_data_source.dart';
import 'package:moja_lodowka/domain/models/user_model/user_model.dart';

@injectable
class RootRepository {
  final RootRemoteDataSource _rootRemoteDataSource;

  RootRepository(this._rootRemoteDataSource);

  Stream<UserModel?> getUser() {
    return _rootRemoteDataSource.getUserData().map((user) {
      return UserModel(user: user);
    });
  }

  Future<void> createAccount(String email, String password) async {
    await _rootRemoteDataSource.createAccount(email, password);
  }

  Future<void> logIn(String email, String password) async {
    await _rootRemoteDataSource.logIn(email, password);
  }

  Future<void> logOut() async {
    await _rootRemoteDataSource.logOut();
  }

  Future<void> deleteAccount() async {
    await _rootRemoteDataSource.deleteAccount();
  }
}
