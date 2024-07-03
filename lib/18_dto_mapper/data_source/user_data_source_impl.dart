import 'dart:convert';

import 'package:learn_dart_together/18_dto_mapper/data_source/user_data_source.dart';
import 'package:learn_dart_together/18_dto_mapper/dto/user_dto.dart';
import 'package:http/http.dart' as http;

class UserDataSourceImpl implements UserDataSource {
  @override
  Future<List<UserDto>> getUsers() async {
    final http.Response response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    final List jsonList = jsonDecode(response.body);
    return jsonList.map((e) => UserDto.fromJson(e)).toList();
  }
}
