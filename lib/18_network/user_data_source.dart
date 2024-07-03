import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:learn_dart_together/17_dto/dto/user_dto.dart';

class UserDataSource {
  final String _baseUrl;

  UserDataSource(
      {String baseUrl = 'https://jsonplaceholder.typicode.com/users'})
      : _baseUrl = baseUrl;

  Future<List<UserDto>> getUsers() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      final List jsonList = jsonDecode(response.body);
      return jsonList.map((e) => UserDto.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load users.');
    }
  }

  Future<void> addUser(UserDto userDto) async {
    final response = await http.post(
      Uri.parse(_baseUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(userDto.toJson()),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to add user.');
    }
  }

  Future<void> updateUser(int id, UserDto userDto) async {
    final response = await http.put(
      Uri.parse('$_baseUrl/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(userDto.toJson()),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to update user.');
    }
  }

  Future<void> deleteUser(int id) async {
    final response = await http.delete(Uri.parse('$_baseUrl/$id'));

    if (response.statusCode != 200) {
      throw Exception('Failed to delete user.');
    }
  }
}
