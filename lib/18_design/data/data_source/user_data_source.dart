import 'dart:convert';
import 'dart:io';

import 'package:collection/collection.dart';
import 'package:fast_csv/csv_converter.dart';
import 'package:learn_dart_together/18_design/data/model/user.dart';

import '../mapper/user_mapper.dart';

class UserDataSource {
  static const _fileName = 'user_file.csv';
  static const _path = 'lib/18_design/assets/$_fileName';

  Future<List<User>> getUsers() async {
    try {
      final input = File(_path);
      final data = await input.readAsString();
      final fields = CsvConverter().convert(data);

      fields.removeAt(0);

      return fields.map((row) => User.fromCsv(row)).toList();
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<User?> getUser(int id) async {
    try {
      final input = File(_path);
      final data = await input.readAsString();
      final fields = CsvConverter().convert(data);

      fields.removeAt(0);

      return fields
          .map((row) => User.fromCsv(row))
          .singleWhereOrNull((user) => user.id == id);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<User> createUser(User user) async {
    try {
      final input = File(_path);
      await input.writeAsString(
        '\n${UserMapper(user).toCSV()}',
        mode: FileMode.append,
        encoding: utf8,
      );
      return user;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<User> deleteUser(int id) async {
    try {
      final user = await getUser(id);
      if (user == null) throw Exception('User not found');

      final input = File(_path);
      final tempFile = File('lib/18_design/assets/temp_$_fileName');
      final lines = await input.readAsLines();
      final target = UserMapper(user).toCSV();

      final result = lines
          .where((line) => line.trim().isNotEmpty && line != target)
          .join('\n');

      await input.writeAsString(
        result,
        encoding: utf8,
      );
      await tempFile.writeAsString(
        target,
        encoding: utf8,
      );

      return user;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<User> updateUser(int targetId, User user) async {
    try {
      final input = File(_path);
      final lines = await input.readAsLines();
      final targetUser = await getUser(targetId);
      if (targetUser == null) throw Exception('User not found');

      final target = UserMapper(targetUser).toCSV();
      final goal = UserMapper(user).toCSV();

      final result = lines.map((line) {
        if (line == target) {
          return goal;
        }
        return line;
      }).toList();

      await input.writeAsString(
        result.join('\n'),
        encoding: utf8,
      );

      return user;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> cancelDelete() async {
    try {
      final mainFile = File(_path);
      final tempFile = File('lib/18_design/assets/temp_$_fileName');

      if (!await tempFile.exists()) {
        throw Exception('파일이 없습니다.');
      }

      final deletedLine = await tempFile.readAsString();

      await mainFile.writeAsString(
        '\n$deletedLine',
        mode: FileMode.append,
        encoding: utf8,
      );

      await tempFile.delete();
    } catch (e) {
      throw Exception(e);
    }
  }
}
