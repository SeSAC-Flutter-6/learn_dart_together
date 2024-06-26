import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:learn_dart_together/18_model_repository/model/user.dart';

class UserApi {
  Future<List<User>> getUsers() async {
    final http.Response response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    final List<dynamic> jsonList = jsonDecode(response.body);
    return jsonList.map((e) => User.fromJson(e)).toList();
  }

  Future<List<User>> getUsersTop10ByName() async {
    final http.Response response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    final List<dynamic> jsonList = jsonDecode(response.body);
    List<User> users = jsonList.map((e) => User.fromJson(e)).toList();

    // 사용자 이름(name)을 기준으로 알파벳 순으로 정렬 후 상위 10개 선택
    users.sort((a, b) => a.name.compareTo(b.name));
    List<User> top10UsersByName = users.take(10).toList();

    return top10UsersByName;
  }
}

void main() async {
  UserApi userApi = UserApi();
  try {
    List<User> top10Users = await userApi.getUsersTop10ByName();
    top10Users.forEach((user) {
      print(user);
    });
  } catch (e) {
    print('Error: $e');
  }
}
