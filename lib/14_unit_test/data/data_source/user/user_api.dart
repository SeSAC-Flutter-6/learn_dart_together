abstract interface class UserApi {
  Future<List<Map<String, dynamic>>> getAllUsers();
  Future<Map<String, dynamic>?> getUser(int userId);
  Future<void> deleteUser(int userId);
  Future<void> createUser(Map<String, dynamic> user);
  Future<void> updateUser(Map<String, dynamic> user);
  Future<bool> checkUserExists(int userId);
}
