import 'dart:convert';
import 'package:learn_dart_together/14_datasource/user/user.dart';
import 'package:http/http.dart' as http;

class UserDataSource {
  Future<List<User>> fetchUsers() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    final List jsonList = jsonDecode(response.body);
    return jsonList.map((e) => User.fromJson(e)).toList();
  }
}
