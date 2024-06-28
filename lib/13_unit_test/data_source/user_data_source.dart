import 'package:learn_dart_together/13_unit_test/model/user.dart';

abstract interface class UserDataSource {
  Future<void> createUser(User user);

  Future<User> getUser(int userId);

  Future<void> updateUser(User user);

  Future<void> deleteUser(int userId);

  Future<Set<User>> getAllUsers();
}