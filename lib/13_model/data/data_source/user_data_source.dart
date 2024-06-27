import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:learn_dart_together/12_data_source/user/user.dart';

class UserDataSource {
  static final _baseUrl = 'https://jsonplaceholder.typicode.com/users';

  Future<List<User>> getUsers() async {
    final http.Response response = await http.get(Uri.parse(_baseUrl));
    final List jsonList = jsonDecode(response.body);

    return jsonList.map((users) => User.fromJson(users)).toList();
  }
}
