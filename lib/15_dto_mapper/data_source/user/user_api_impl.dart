import 'dart:convert';
import 'package:learn_dart_together/15_dto_mapper/data_source/user/user_api.dart';
import 'package:learn_dart_together/15_dto_mapper/dto/user_dto/user_dto.dart';
import 'package:http/http.dart' as http;

class UserApiImpl implements UserApi {
  static final _baseURL = 'https://jsonplaceholder.typicode.com/users';

  @override
  Future<bool> createUser(UserDto dto) async {
    try {
      final Map<String, dynamic> userJson = dto.toJson();
      final response = await http.post(
        Uri.parse(_baseURL),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(userJson),
      );
      if (response.statusCode == 201) {
        print('User created successfully: ${response.body}');
        return true;
      } else {
        print('Failed to create user: ${response.statusCode}');
        return false;
      }
    } catch (error) {
      throw Exception('Error creating user: $error');
    }
  }

  @override
  Future<List<UserDto>> getUsers() async {
    try {
      final response = await http.get(Uri.parse(_baseURL));
      if (response.statusCode == 200) {
        final List jsonList = jsonDecode(utf8.decode(response.bodyBytes));
        return jsonList
            .map((e) => UserDto.fromJson(e as Map<String, dynamic>))
            .toList();
      } else {
        throw Exception('Failed to getUsers: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Error getUsers : $error');
    }
  }
}
