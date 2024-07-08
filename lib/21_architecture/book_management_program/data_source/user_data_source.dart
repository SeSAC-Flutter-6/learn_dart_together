import 'package:learn_dart_together/21_architecture/book_management_program/model/user.dart';

abstract interface class UserDataSource {
  Future<List<User>> getUsers();

  Future<void> addUser(User user);

  Future<void> deleteUser(User user);

  Future<void> updateUser(User user);
}
