import '../model/user.dart';

abstract interface class UserRepository {
  Future<void> createUser({required String name, required String email});
  Future<User?> getUser({required int id});
  Future<void> updateUser({required int id, String? name, String? email});
  Future<void> deleteUser({required int id});
  Future<List<User>> getAllUsers();
  Future<User?> findUserByEmail({required String email});
}
