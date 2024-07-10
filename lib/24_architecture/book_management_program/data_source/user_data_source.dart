import '../model/user.dart';

abstract interface class UserDataSource {
  Future<List<User>> getUsers();

  Future<void> addUser(User user);

  Future<void> updateUser(User user);

  Future<void> deleteUser(User user);
}
