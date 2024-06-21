import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:learn_dart_together/18_data_source/user.dart';

class UserDataSource {
  Future<List<User>> getUserList() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    final json = jsonDecode(response.body) as List;
    return json.map((e) => User.fromJson(e)).toList();
  }
}
