import 'dart:convert';

import 'package:learn_dart_together/17_test/practice_1/data_source/user_data_source.dart';
import 'package:learn_dart_together/17_test/practice_1/model/user.dart';
import 'package:learn_dart_together/17_test/practice_1/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource _dataSource;

  UserRepositoryImpl(this._dataSource);

  @override
  Future<String> createUser(User? user) async {
    if (user!.id != null) {
      throw Exception('Id must be null');
    }
    if (user.name.isEmpty || user.email.isEmpty || user.createdAt == null) {
      throw Exception('Name, Email, CreatedAt must not be empty');
    }
    // 중복된 이메일로 생성하는 경우 에러 처리. findUserByEmail 메서드 사용하지 말기.
    List<User> users = await _dataSource.getAllUsers();
    if (users.any((e) => e.email == user.email)) {
      throw Exception('Email already exists');
    }
    return _dataSource.createUser(user);
  }

  @override
  Future<String> deleteUser(int id) async {
    try {
      await getUser(id);
    } catch (e) {
      throw Exception('User not found');
    }
    return await _dataSource.deleteUser(id);
  }

  @override
  Future<List<User>> getAllUsers() async {
    return await _dataSource.getAllUsers();
  }

  @override
  Future<User> getUser(int? id) async {
    try {
      return await _dataSource.getUser(id);
    } catch (e) {
      throw Exception('User not found');
    }
  }

  @override
  Future<User> updateUser(User user) async {
    try {
      await getUser(user.id);
    } catch (e) {
      throw Exception('User not found');
    }
    if (user.name.isEmpty || user.email.isEmpty || user.createdAt == null) {
      throw Exception('Name, Email, CreatedAt must not be empty');
    }
    return await _dataSource.updateUser(user);
  }

  @override
  Future<User> findUserByEmail(String email) async {
    List<User> users = await getAllUsers();
    try {
      return users.firstWhere((e) => e.email == email);
    } catch (e) {
      throw Exception('User not found');
    }
  }
}
