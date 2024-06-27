import 'package:collection/collection.dart';

import './user_repository.dart';
import '../model/user.dart';
import 'package:learn_dart_together/data_source/base_data_source.dart';

class UserRepositoryImpl implements UserRepository {
  final BaseDataSource _baseDataSource;

  UserRepositoryImpl(this._baseDataSource);

  @override
  Future<List<User>> getUsers() async {
    return _baseDataSource.fetchData<User>(
      'https://jsonplaceholder.typicode.com/users',
      (json) => User.fromJson(json),
    );
  }

  @override
  Future<List<User>> getUsersTop10ByUserName() async {
    List<User> allUsers = await getUsers();
    return allUsers.sortedBy((user) => user.username);
  }
}
