import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:learn_dart_together/17_dto/dto/user_dto.dart';

abstract interface class UserDataSource {
  Future<List<UserDto>> getUsers();
}

class UserDataSourceImpl implements UserDataSource {
  @override
  Future<List<UserDto>> getUsers() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    final List jsonList = jsonDecode(response.body);
    return jsonList.map((e) => UserDto.fromJson(e)).toList();
  }
}
