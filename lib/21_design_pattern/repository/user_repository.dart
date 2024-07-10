import 'package:learn_dart_together/21_design_pattern/model/user.dart';

abstract interface class UserRepository {
  Future<User> getUser(int id);
  Future<List<User>> getUsers();
  Future<User> createUser(User user);
  Future<User> updateUser(User user);
  Future<User> deleteUser(int id);
}
