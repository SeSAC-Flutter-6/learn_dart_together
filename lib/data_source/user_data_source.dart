import 'package:http/http.dart' as http;
import 'dart:convert';
import '../15_datasource/practice_123/user.dart';

// DataSource
class UserDataSource {
  Future<List<User>> getUsers() async {
    final http.Response response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    // response.body == Json String
    List jsonList = jsonDecode(response.body);
    return jsonList.map((e) => User.fromJson(e)).toList();
  }
}
