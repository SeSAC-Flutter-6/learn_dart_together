abstract interface class UserApi {
  Future<void> createUser(Map<String, dynamic> user);
  Future<List<Map<String, dynamic>>> getAllUsers();
  Future<Map<String, dynamic>?> getUser(int userId);
  Future<bool> checkUserExists(int userId);
  Future<void> updateUser(Map<String, dynamic> user);
  Future<void> deleteUser(int userId);
}
