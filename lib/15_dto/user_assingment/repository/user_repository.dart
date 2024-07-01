import '../model/user.dart';

abstract interface class UserRepository {
  Future<List<User>> getAllUsers();

  Future<User?> getUser(String name);
}
