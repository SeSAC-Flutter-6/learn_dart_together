import 'package:learn_dart_together/14_unit_test/user/user.dart';

abstract interface class UserRepository {
  Future<void> createUser(User user);
  Future<User?> getUser(int id);
  Future<User> updateUser(User user);
  Future<void> deleteUser(int id);
  Future<List<User>> getAllUsers();
  Future<User?> findUserByEmail(String email);
}