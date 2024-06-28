import 'package:learn_dart_together/14_unit_test/data/model/user.dart';

abstract interface class UserRepository {
  Future<bool> createUser(User user);
  Future<User?> getUser(int userId);
  Future<bool> updateUser(User updatedUser);
  Future<bool> deleteUser(int userId);
  Future<List<User>> getAllUsers();
  Future<User?> findUserByEmail(String email);
}
