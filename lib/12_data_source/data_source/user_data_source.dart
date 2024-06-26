import 'dart:convert';

import 'package:http/http.dart' as http;

import '../user/user.dart';


class UserDataSource {
  Future<List<User>> getUsers() async {
    final http.Response response =
    await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    List jsonList = jsonDecode(response.body);

    return jsonList.map((e) => User.fromJson(e)).toList();
  }
}