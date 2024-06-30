import 'dart:convert';

import 'package:learn_dart_together/18_dto_mapper/practice_2/data_source/user_data_souce.dart';
import 'package:learn_dart_together/18_dto_mapper/practice_2/dto/user_dto/user_dto.dart';
import 'package:http/http.dart' as http;

class UserApi implements UserDataSource {
  @override
  Future<List<UserDto>> getAllUsers() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    return jsonDecode(response.body);
  }
}
