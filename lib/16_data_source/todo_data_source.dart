import 'dart:convert';

import 'package:http/http.dart' as http;

class TodoDataSource {
  final String _baseUrl;

  const TodoDataSource({
    String? baseUrl,
  }) : _baseUrl = baseUrl ?? 'https://jsonplaceholder.typicode.com/todos';

  Future<Todo> getTodo({required int id}) async {
    // http
    //     .get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'))
    //     .then((res) => jsonDecode(res.body))
    //     .then((json) => print(json));
    final response = await http.get(Uri.parse('$_baseUrl/$id'));
    final Todo todo = Todo.fromJson(jsonDecode(response.body));

    return todo;
  }

  Future<List<Todo>> getTodoList() async {
    final responseTodos = await http.get(Uri.parse(_baseUrl));

    final List<Todo> todoList = jsonDecode(responseTodos.body)
            .map<Todo>((json) => Todo.fromJson((json as Map<String, dynamic>)))
            .toList() ??
        [];
    return todoList;
  }

  Future<String> createTodo() async {
    final response = await http.post(Uri.parse(_baseUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'userId': 'test id',
          'title': 'test title',
        }));
    final String message;
    if (response.statusCode == 201) {
      message = response.body;
    } else {
      message = 'create failed';
    }
    return message;
  }

  Future<String> updateTodo({required int id}) async {
    final response = await http.put(Uri.parse('$_baseUrl/$id'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'userId': 'updated id',
          'title': 'updated title',
        }));
    final String message;
    if (response.statusCode == 200) {
      message = response.body;
    } else {
      message = 'update failed';
    }
    return message;
  }

  Future<String> deleteTodo({required int id}) async {
    final response = await http.delete(Uri.parse('$_baseUrl/$id'));
    final String message;
    if (response.statusCode == 200) {
      message = response.body;
    } else {
      message = 'delete failed';
    }
    return message;
  }
}

class Todo {
  int userId;
  int id;
  String title;
  bool completed;

  Todo({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  Todo.fromJson(Map<String, dynamic> json)
      : userId = json['userId'],
        id = json['id'],
        title = json['title'],
        completed = json['completed'];

  @override
  String toString() {
    return 'Todo{userId: $userId, id: $id, title: $title, completed: $completed}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Todo &&
          runtimeType == other.runtimeType &&
          userId == other.userId &&
          id == other.id &&
          title == other.title &&
          completed == other.completed;

  @override
  int get hashCode =>
      userId.hashCode ^ id.hashCode ^ title.hashCode ^ completed.hashCode;

  Todo copyWith({
    required int userId,
    required int id,
    required String title,
    required bool completed,
  }) =>
      Todo(
        userId: userId ?? this.userId,
        id: id ?? this.id,
        title: title ?? this.title,
        completed: completed ?? this.completed,
      );
}
