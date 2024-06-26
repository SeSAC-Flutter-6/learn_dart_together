import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/user.dart';

class UserDataSource {
  static final _baseUrl = 'https://jsonplaceholder.typicode.com/users';

  Future<List<User>> getUsers() async {
    final http.Response response = await http.get(Uri.parse(_baseUrl));
    List jsonList = jsonDecode(response.body);
    return jsonList.map((e) => User.fromJson(e)).toList();
  }
}
