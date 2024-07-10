import 'package:learn_dart_together/23_design_pattern/model/user.dart';
abstract interface class UserRepository {
  bool addUser(User user); 
  List<User> getAllUsers(); 
  User? getUserById(int id); 
  void updateUser(int id, User user); 
    void deleteUser(int id); 
  int generateUserId(); 
  Future<void> saveUsers();
  User? undoDeleteUser(int id); 
}