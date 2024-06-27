import 'package:learn_dart_together/16_model_repository/model/user.dart';
import 'package:learn_dart_together/16_model_repository/repository/user_repository.dart';

import '../datasource/user_data_source.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource _userDataSource;

  UserRepositoryImpl(this._userDataSource);

  @override
  Future<List<User>> getUsers() => _userDataSource.getUsers();

  @override
  Future<List<User>> getUsersTop10ByUserName() async {
    List<User> users = await _userDataSource.getUsers();
    users.sort((a, b) => a.username.compareTo(b.username));
    return users.take(10).toList();
  }
}
