import 'package:learn_dart_together/19_unit_test/model/user.dart';

abstract class UserRepository {
  Future<void> createUser(User user);
  Future<User> getUser(int userId);
  Future<void> updateUser(User user);
  Future<void> deleteUser(int userId);
  Future<List<User>> getAllUsers();
  Future<User?> findUserByEmail(String email);
}
