
import 'package:learn_dart_together/13_unit_test/data_source/user_data_source.dart';
import 'package:learn_dart_together/13_unit_test/model/user.dart';

final class InMemoryUserDataSourceImplException implements Exception {
  final String message;

  InMemoryUserDataSourceImplException(this.message);

  @override
  String toString() => 'InMemoryUserDataSourceImplException: $message';
}

final class InMemoryUserDataSourceImpl implements UserDataSource {
  final Set<User> users = {};

  Future<void> createUser(User user) async {
    users.add(user);
  }

  Future<User> getUser(int userId) async {
    return users.firstWhere((e) => e.id == userId, orElse: () => throw InMemoryUserDataSourceImplException('UserID가 일치하는 사용자가 존재하지 않습니다.'));
  }

  Future<void> updateUser(User user) async {
    users.removeWhere((e) => e.id == user.id);
    users.add(user);
  }

  Future<void> deleteUser(int userId) async {
    users.removeWhere((e) => e.id == userId);
  }
  
  Future<Set<User>> getAllUsers() async {
    return users;
  }

}