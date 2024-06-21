import 'package:http/http.dart' as http;
import 'dart:convert';
import '../15_datasource/practice_123/todo.dart';

// DataSource
class TodoDataSource {
  Future<List<Todo>> getTodos() async {
    final http.Response response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));

    // response.body == Json String
    List jsonList = jsonDecode(response.body);
    return jsonList.map((e) => Todo.fromJson(e)).toList();
  }

  Future<Todo> getTodo(int id) async {
    final http.Response response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/todos/$id'));

    // response.body == Json String
    final Map<String, dynamic> json = jsonDecode(response.body);

    if (!json.containsValue(id)) {
      throw TodoNotFoundException("Todo with ID $id not found.");
    }

    return Todo.fromJson(json);
  }
}

class TodoNotFoundException implements Exception {
  final String message;
  TodoNotFoundException(this.message);

  @override
  String toString() => "TodoNotFoundException: $message";
}
