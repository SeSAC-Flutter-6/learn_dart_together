import 'dart:convert';
import 'package:learn_dart_together/12_data_source/dto/todo.dart';
import 'package:http/http.dart' as http;

final class TodoDataSource {
  Future<List<Todo>> getTodos() async {
    final http.Response response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));
    List jsonList = jsonDecode(response.body);
    return jsonList.map((e) => Todo.fromJson(e)).toList();
  }

  Future<List<Todo>> getCompletedTodos() async {
    final http.Response response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));
    List jsonList = jsonDecode(response.body);
    return jsonList.map((e) => Todo.fromJson(e)).where((e) => e.completed).toList();
  }
}