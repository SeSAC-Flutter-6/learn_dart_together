import 'dart:convert';
import 'dart:io';

import 'package:csv/csv.dart';
import 'package:learn_dart_together/21_architecture/book_management_program/data_source/user_data_source.dart';
import 'package:learn_dart_together/21_architecture/book_management_program/model/user.dart';

class UserDataSourceImpl implements UserDataSource {
  Future<List<List<dynamic>>> _getFile() async {
    final file = await File(
            'lib/21_architecture/book_management_program/data/user_data.csv')
        .openRead()
        .transform(utf8.decoder)
        .transform(CsvToListConverter())
        .toList();
    return file;
  }

  @override
  Future<List<User>> getUsers() async {
    final allFile = await _getFile();
    final file = allFile.sublist(1);

    final List<User> userList = file.map((e) => User.fromList(e)).toList();
    return userList;
  }

  @override
  Future<void> addUser(User user) async {
    final file = await _getFile();
    final result =
        File('lib/21_architecture/book_management_program/data/user_data.csv');
    file.add(user.toJson().values.toList());
    String csvContent = const ListToCsvConverter().convert(file);
    await result.writeAsString(csvContent);
  }

  @override
  Future<void> updateUser(User user) async {
    final result =
        File('lib/21_architecture/book_management_program/data/user_data.csv');
    final allFile = await _getFile();
    final first = allFile[0];
    final file = allFile.sublist(1);
    final List<User> userList = file.map((e) => User.fromList(e)).toList();
    final index = userList.indexWhere((e) => e.id == user.id);
    userList[index] = user;
    final csvList = userList.map((e) => e.toJson().values.toList()).toList();
    csvList.insert(0, first);
    String csvContent = const ListToCsvConverter().convert(csvList);
    await result.writeAsString(csvContent);
  }

  @override
  Future<void> deleteUser(User user) async {
    final result =
        File('lib/21_architecture/book_management_program/data/user_data.csv');
    final allFile = await _getFile();
    final first = allFile[0];
    final file = allFile.sublist(1);
    final List<User> userList = file.map((e) => User.fromList(e)).toList();
    userList.removeWhere((e) => e.id == user.id);
    final csvList = userList.map((e) => e.toJson().values.toList()).toList();
    csvList.insert(0, first);
    String csvContent = const ListToCsvConverter().convert(csvList);
    await result.writeAsString(csvContent);
  }
}

void main() async {
  final user = User(
      id: 1,
      registrationDate: '0000/01/22',
      name: '이순신',
      address: '양천구',
      phoneNumber: '010-1111-2222',
      birthday: '2024/12/22');

  // print(await UserDataSourceImpl().getUsers());
  await UserDataSourceImpl().addUser(user);
  // await UserDataSourceImpl().deleteUser(user);
  // await UserDataSourceImpl().updateUser(user);
}
