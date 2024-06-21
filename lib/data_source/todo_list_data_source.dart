import 'dart:convert';

import 'package:learn_dart_together/18_data_source/todo.dart';
import 'package:http/http.dart' as http;

class TodoListDataSource {
  Future<List<Todo>> getTodoList() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));
    final json = jsonDecode(response.body) as List;
    return json.map((e) => Todo.fromJson(e)).toList();
  }
}
