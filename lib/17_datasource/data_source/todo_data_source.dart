import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:learn_dart_together/17_datasource/todo.dart';

class TodoApi {
  static Future<List<Todo>> getTodos() async {
    final http.Response response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));
    final List jsonList = jsonDecode(response.body) as List;

    return jsonList.map((e) => Todo.fromJson(e)).toList();
  }

  static Future<Todo> getTodo(int id) async {
    final http.Response response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/todos/$id'));
    final Map<String, dynamic> map = jsonDecode(response.body);

    return Todo.fromJson(map);
  }
}

void main() async {
  // 모든 Todo 리스트 가져오기
  List<Todo> todos = await TodoApi.getTodos();
  print('Todos:');
  todos.forEach((todo) => print(todo));
  print('---');

  // id가 1인 Todo 가져오기
  int todoId = 1;
  Todo todo = await TodoApi.getTodo(todoId);
  print('Todo with id $todoId:');
  print(todo);
}
