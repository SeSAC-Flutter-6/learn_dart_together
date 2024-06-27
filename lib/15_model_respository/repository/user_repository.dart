import 'package:learn_dart_together/15_model_respository/data_source/user_data_source.dart';
import 'package:collection/collection.dart';
import '../../14_datasource/user/user.dart';

abstract interface class UserRepository {
  Future<List<User>> getUsers();
  Future<List<User>> getUsersTop10ByUserName();
}

class UserRepositoryImpl implements UserRepository {
  final _dataSource = UserDataSource();

  @override
  Future<List<User>> getUsers() async {
    return await _dataSource.fetchUsers();
  }

  @override
  Future<List<User>> getUsersTop10ByUserName() async {
    return (await getUsers())
        .sorted((a, b) => a.username.compareTo(b.username))
        .take(10)
        .toList();
  }
}
