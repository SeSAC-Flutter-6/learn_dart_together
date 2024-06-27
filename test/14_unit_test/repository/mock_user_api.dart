import 'dart:async';
import 'package:learn_dart_together/14_unit_test/data/data_source/user/user_api.dart';
import '../../dummy_data/dummy_user.dart';

class MockUserApi implements UserApi {
  @override
  Future<bool> checkUserExists(int userId) async {
    return dummyUsers.any((user) => user['id'] == userId);
  }

  @override
  Future<void> createUser(Map<String, dynamic> user) async {
    dummyUsers.add(user);
  }

  @override
  Future<void> deleteUser(int userId) async {
    dummyUsers.removeWhere((user) => user['id'] == userId);
  }

  @override
  Future<List<Map<String, dynamic>>> getAllUsers() async {
    return List<Map<String, dynamic>>.from(dummyUsers);
  }

  @override
  Future<Map<String, dynamic>?> getUser(int userId) async {
    for (var user in dummyUsers) {
      if (user['id'] == userId) {
        return user;
      }
    }
    return null;
  }

  @override
  Future<void> updateUser(Map<String, dynamic> user) async {
    int index = dummyUsers.indexWhere((u) => u['id'] == user['id']);
    if (index != -1) {
      dummyUsers[index] = user;
    }
  }
}
