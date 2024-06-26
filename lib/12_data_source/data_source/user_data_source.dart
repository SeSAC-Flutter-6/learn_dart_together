import 'dart:convert';
import 'package:collection/collection.dart';
import 'package:http/http.dart' as http;
import 'package:learn_dart_together/12_data_source/dto/user.dart';

final class UserDataSource {
  Future<List<User>> getUsers() async {
    final http.Response response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    List jsonList = jsonDecode(response.body);
    return jsonList.map((e) => User.fromJson(e)).toList();
  }

  Future<List<User>> getUsersTop10ByUserName() async {
    final http.Response response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    List jsonList = jsonDecode(response.body);
    return jsonList.map((e) => User.fromJson(e)).sortedBy<String>((e) => e.username).toList().sublist(0, 9);
  }
}