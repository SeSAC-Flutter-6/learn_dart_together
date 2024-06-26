import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:learn_dart_together/19_model_repository/model/todo.dart';

class TodoDataSource {
  Future<List<Todo>> getData() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));
    final data = jsonDecode(response.body) as List;
    return data.map((e) => Todo.fromJson(e)).toList();
  }
}
