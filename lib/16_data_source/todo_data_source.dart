import 'dart:convert';

import 'package:http/http.dart' as http;

class TodoDataSource {
  Future<Todo> getTodo() async {
    // http
    //     .get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'))
    //     .then((res) => jsonDecode(res.body))
    //     .then((json) => print(json));
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));
    final Todo todo = Todo.fromJson(jsonDecode(response.body));

    return todo;
  }

  Future<List<Todo>> getTodoList() async {
    final responseTodos =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));

    final List<Todo> todoList = jsonDecode(responseTodos.body)
            .map<Todo>((json) => Todo.fromJson((json as Map<String, dynamic>)))
            .toList() ??
        [];
    return todoList;
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
