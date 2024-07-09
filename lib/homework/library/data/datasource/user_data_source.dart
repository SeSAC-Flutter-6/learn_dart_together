import 'package:learn_dart_together/homework/library/data/model/user.dart';

abstract interface class UserDataSource {
  Future<List<User>> getUsers();

  Future<void> createUser(User user);

  Future<void> updateUser(int id, User user);

  Future<void> deleteUser(int id);

  Future<void> cancelDelete();
}
