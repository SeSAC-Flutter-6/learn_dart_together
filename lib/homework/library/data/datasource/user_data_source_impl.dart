import 'dart:io';

import 'package:csv/csv.dart';
import 'package:learn_dart_together/homework/library/data/datasource/user_data_source.dart';
import 'package:learn_dart_together/homework/library/data/model/user.dart';

class UserDataSourceImpl implements UserDataSource {
  static final String _filePath = 'users.csv';
  User? _lastDeletedUser;

  Future<List<User>> _loadUsers() async {
    final file = File(_filePath);
    if (!await file.exists()) {
      return [];
    }
    final data = await file.readAsString();
    final fields = const CsvToListConverter().convert(data);
    if (fields.isEmpty || fields.length == 1) return [];
    return fields.sublist(1).map((row) => User.fromCsv(row)).toList();
  }

  Future<void> _saveUsers(List<User> users) async {
    final file = File(_filePath);
    final rows = [
      ['id', 'name', 'address', 'phoneNumber', 'birthday', 'joinedDate'],
      ...users.map((user) => user.toCsv())
    ];
    final csvData = const ListToCsvConverter().convert(rows);
    await file.writeAsString(csvData);
  }

  @override
  Future<List<User>> getUsers() async {
    try {
      return await _loadUsers();
    } catch (e) {
      print('회원조회 실패: $e');
      return [];
    }
  }

  @override
  Future<void> createUser(User user) async {
    try {
      final users = await _loadUsers();
      final maxId = users.isEmpty
          ? 0
          : users.map((u) => u.id).reduce((a, b) => a > b ? a : b);
      final newUser = user.copyWith(id: maxId + 1);
      users.add(newUser);
      await _saveUsers(users);
    } catch (e) {
      print('회원등록 실패: $e');
    }
  }

  @override
  Future<void> updateUser(int id, User updatedUser) async {
    try {
      final users = await _loadUsers();
      final index = users.indexWhere((user) => user.id == id);
      if (index == -1) throw Exception('회원을 찾을 수 없습니다.');
      users[index] = updatedUser;
      await _saveUsers(users);
    } catch (e) {
      print('회원수정 실패: $e');
    }
  }

  @override
  Future<void> deleteUser(int id) async {
    try {
      final users = await _loadUsers();
      final index = users.indexWhere((user) => user.id == id);
      if (index == -1) throw Exception('회원을 찾을 수 없습니다.');
      _lastDeletedUser = users.removeAt(index);
      await _saveUsers(users);
    } catch (e) {
      print('회원삭제 실패: $e');
    }
  }

  @override
  Future<void> cancelDelete() async {
    if (_lastDeletedUser == null) {
      throw Exception('복구할 회원을 찾을 수 없습니다.');
    }
    try {
      final users = await _loadUsers();
      users.add(_lastDeletedUser!);
      await _saveUsers(users);
      _lastDeletedUser = null;
    } catch (e) {
      print('회원복구 실패: $e');
    }
  }
}
