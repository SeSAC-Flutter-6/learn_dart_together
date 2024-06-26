import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:learn_dart_together/18_model_repository/model/todos.dart';

class TodoApi {
  Future<List<Todos>> getTodos() async {
    final http.Response response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));
    final List<dynamic> jsonList = jsonDecode(response.body);
    return jsonList.map((e) => Todos.fromJson(e)).toList();
  }

  Future<List<Todos>> getCompletedTodos() async {
    final http.Response response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/todos?completed=true'));
    final List<dynamic> jsonList = jsonDecode(response.body);
    return jsonList.map((e) => Todos.fromJson(e)).toList();
  }
}
