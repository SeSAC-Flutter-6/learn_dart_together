import 'package:collection/collection.dart';
import 'package:learn_dart_together/16_data_source/users_data_source.dart';

class UserRepositoryImpl implements UserRepository {
  @override
  Future<List<User>> getUsers() async {
    final results = await UsersDataSource().getUserList();
    return results;
  }

  @override
  Future<List<User>> getUsersTopByUserName(int top) async {
    final results = await UsersDataSource().getUserList();
    final List<User> filteredComments =
        results.sortedBy((user) => user.name).take(top).toList();
    return filteredComments;
  }
}

abstract interface class UserRepository {
  Future<List<User>> getUsers();

  Future<List<User>> getUsersTopByUserName(int top);
}
