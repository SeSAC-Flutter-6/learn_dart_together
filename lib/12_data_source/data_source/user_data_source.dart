import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:learn_dart_together/12_data_source/dto/user.dart';

final class UserDataSource {
  static Future<List<User>> getUsers() async {
    final http.Response response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    List jsonList = jsonDecode(response.body);
    return jsonList.map((e) => User.fromJson(e)).toList();
  }
}