import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:learn_dart_together/18_data_source/todo.dart';

class TodoDataSource {
  Future<Todo> getTodo() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));
    final json = jsonDecode(response.body);
    return Todo.fromJson(json);
  }
}
