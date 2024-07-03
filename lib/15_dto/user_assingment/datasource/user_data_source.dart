import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:http/http.dart' as http;
import 'package:learn_dart_together/15_dto/user_assingment/dto/user_dto.dart';

class UserDataSource {
  static final _baseUrl = 'https://jsonplaceholder.typicode.com/users';

  Future<List<UserDto>> getUsers() async {
    final http.Response response = await http.get(Uri.parse(_baseUrl));
    final List jsonList = jsonDecode(response.body);

    return jsonList.map((user) => UserDto.fromJson(user)).toList();
  }

  Future<UserDto?> getUser(String name) async {
    final http.Response response = await http.get(Uri.parse(_baseUrl));
    final List jsonList = jsonDecode(response.body);

    return jsonList
        .singleWhereOrNull((user) => UserDto.fromJson(user).name == name);
  }
}
