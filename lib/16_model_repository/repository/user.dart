import 'package:collection/collection.dart';
import 'package:learn_dart_together/16_data_source/users_data_source.dart';

class UserRepositoryImpl implements UserRepository {
  @override
  Future<List<User>> getUsers() async {
    final results = await UsersDataSource().getUserList();
    return results;
  }

  @override
  Future<List<User>> getUsersTop10ByUserName() async {
    final results = await UsersDataSource().getUserList();
    final List<User> filteredComments =
        results.sortedBy((user) => user.name).take(10).toList();
    return filteredComments;
  }
}

abstract interface class UserRepository {
  Future<List<User>> getUsers();

  Future<List<User>> getUsersTop10ByUserName();
}
