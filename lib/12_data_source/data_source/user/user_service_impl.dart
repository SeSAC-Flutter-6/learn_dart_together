import 'dart:convert';
import 'package:learn_dart_together/13_model_repository/data/model/user.dart';
import 'package:learn_dart_together/12_data_source/data_source/user/user_service.dart';
import 'package:http/http.dart' as http;

class UserServiceImpl implements UserService {
  @override
  Future<User> getUser({required int userId}) async {
    try {
      final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/users/$userId'),
      );
      if (response.statusCode == 200) {
        final Map<String, dynamic> userJson = jsonDecode(response.body);
        return User.fromJson(userJson);
      } else {
        throw Exception('Failed to load: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Error fetching: $error');
    }
  }

  @override
  Future<List<User>> getUserList() async {
    try {
      final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/users'),
      );
      if (response.statusCode == 200) {
        final List<dynamic> userListJson = jsonDecode(response.body);
        final List<User> userList =
            userListJson.map<User>((json) => User.fromJson(json)).toList();
        return userList;
      } else {
        throw Exception('Failed to load: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Error fetching: $error');
    }
  }
}
