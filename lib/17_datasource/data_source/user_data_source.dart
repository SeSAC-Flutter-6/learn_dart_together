import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:learn_dart_together/17_datasource/user.dart';

class UserApi {
  static Future<List<User>> getUsers() async {
    final http.Response response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    final List<dynamic> jsonList = jsonDecode(response.body);
    List<User> users = jsonList.map((json) => User.fromJson(json)).toList();
    return users;
  }
}

void main() async {
  List<User> users = await UserApi.getUsers();
  print('Users:');
  users.forEach((user) => print(user));
}
