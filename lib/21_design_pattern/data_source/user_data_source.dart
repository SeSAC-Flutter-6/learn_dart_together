import 'package:learn_dart_together/21_design_pattern/data_source/memory_data_source/memory_user_api.dart';
import 'package:learn_dart_together/21_design_pattern/model/user.dart';

abstract interface class UserDataSource {
  static UserDataSource? _instance;

  factory UserDataSource([UserDataSource? api]) {
    _instance = api ?? MemoryUserApi();
    return _instance!;
  }

  Future<User> getUser(int id);
  Future<List<User>> getUsers();
  Future<User> createUser(User user);
  Future<User> updateUser(User user);
  Future<User> deleteUser(int id);
}
