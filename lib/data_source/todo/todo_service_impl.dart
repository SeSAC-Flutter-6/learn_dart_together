import 'dart:convert';
import 'package:learn_dart_together/data_source/todo/todo_service.dart';
import 'package:learn_dart_together/12_data_source/todo.dart';
import 'package:http/http.dart' as http;

class TodoServiceImpl implements ToDoService {
  @override
  Future<Todo> getToDo({required int todoId}) async {
    try {
      final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/todos/$todoId'),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> todoJson = jsonDecode(response.body);
        return Todo.fromJson(todoJson);
      } else {
        throw Exception('Failed to load: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Error fetching: $error');
    }
  }

  @override
  Future<List<Todo>> getToDoList() async {
    try {
      final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/todos'),
      );
      if (response.statusCode == 200) {
        final List<dynamic> todoListJson = jsonDecode(response.body);
        final List<Todo> todoList = todoListJson
            .map<Todo>((json) => Todo.fromJson(json))
            .toList();
        return todoList;
      } else {
        throw Exception('Failed to load: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Error fetching: $error');
    }
  }
}
