import 'package:learn_dart_together/17_test/practice_1/model/user.dart';

abstract interface class UserDataSource {
  Future<String> createUser(User user);
  Future<User> getUser(int? id);
  Future<User> updateUser(User user);
  Future<String> deleteUser(int id);
  Future<List<User>> getAllUsers();
}
