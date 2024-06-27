import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:learn_dart_together/14_datasource/todo.dart';

class TodoDataSource {
  Future<List<Todo>> fetchTodos() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));
    final List jsonList = jsonDecode(response.body);
    return jsonList.map((e) => Todo.fromJson(e)).toList();
  }
}
