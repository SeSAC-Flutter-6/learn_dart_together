import 'dart:io';

import 'package:collection/collection.dart';
import 'package:fast_csv/csv_converter.dart';
import 'package:learn_dart_together/18_design/data/model/user.dart';

import '../mapper/user_mapper.dart';

class UserDataSource {
  static const _fileName = 'user_file.csv';
  static const _path = 'lib/18_design/assets/$_fileName';

  Future<List<User>> getUsers() async {
    final input = File(_path);
    final data = await input.readAsString();
    final fields = CsvConverter().convert(data);

    fields.removeAt(0);
    print(fields);

    return fields.map((row) => User.fromCsv(row)).toList();
  }

  Future<User?> getUser(int id) async {
    final input = File(_path);
    final data = await input.readAsString();
    final fields = CsvConverter().convert(data);

    fields.removeAt(0);

    return fields
        .map((row) => User.fromCsv(row))
        .singleWhereOrNull((user) => user.id == id);
  }

  Future<User> createUser(User user) async {
    final input = File(_path);
    input.writeAsString('\n${UserMapper(user).toCSV()}', mode: FileMode.append);
    return user;
  }

  Future<User> deleteUser(int id) async {
    final user = await getUser(id);
    if (user == null) throw Exception('User not found');

    final input = File(_path);
    final tempFile = File('lib/18_design/assets/temp_$_fileName');
    final lines = await input.readAsLines();
    final target = UserMapper(user).toCSV();

    final result = lines
        .where((line) => line.trim().isNotEmpty && line != target)
        .join('\n');

    await input.writeAsString(result);
    await tempFile.writeAsString(target);

    return user;
  }

  Future<User> updateUser(int targetId, User user) async {
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

    await input.writeAsString(result.join('\n'));

    return user;
  }

  Future<void> cancelDelete() async {
    try {
      final mainFile = File(_path);
      final tempFile = File('lib/18_design/assets/temp_$_fileName');

      if (!await tempFile.exists()) return;

      final deletedLine = await tempFile.readAsString();

      await mainFile.writeAsString('\n$deletedLine', mode: FileMode.append);

      await tempFile.delete();
    } catch (e) {
      throw Exception('무언가 에러');
    }
  }
}
