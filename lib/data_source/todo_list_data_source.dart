import 'dart:convert';

import 'package:learn_dart_together/18_data_source/todo.dart';
import 'package:http/http.dart' as http;

class TodoListDataSource {
  final String baseUrl;

  TodoListDataSource({
    this.baseUrl = 'https://jsonplaceholder.typicode.com/todos',
  });

  Future<List<Todo>> getTodoList() async {
    final response = await http.get(Uri.parse(baseUrl));
    final json = jsonDecode(response.body) as List;
    return json.map((e) => Todo.fromJson(e)).toList();
  }
}
