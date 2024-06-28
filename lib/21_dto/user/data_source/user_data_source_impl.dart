import 'dart:convert';

import 'package:learn_dart_together/21_dto/user/data_source/user_data_source.dart';
import 'package:learn_dart_together/21_dto/user/dto/user_dto.dart';
import 'package:http/http.dart' as http;

class UserDataSourceImpl implements UserDataSource {
  @override
  Future<List<UserDto>> getUserDto() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    final data = jsonDecode(response.body) as List;
    return data.map((e) => UserDto.fromJson(e)).toList();
  }
}
