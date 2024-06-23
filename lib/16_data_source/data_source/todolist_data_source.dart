import 'dart:convert';

import 'package:http/http.dart' as http;

void main() {
  TodoDataSource().getTodoList().then((todos) => print(todos));
}

class TodoDataSource {
  Future<List<Todo>> getTodoList() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));
//reponse.body == Json String

    final jsonStringList = response.body;
    final jsonList = jsonDecode(jsonStringList) as List;
    return jsonList.map((e) => Todo.fromJson(e)).toList();
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
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is Todo &&
            runtimeType == other.runtimeType &&
            userId == other.userId &&
            title == other.title &&
            completed == other.completed;
  }

  @override
  int get hashCode =>
      userId.hashCode ^ id.hashCode ^ title.hashCode ^ completed.hashCode;

  @override
  String toString() {
    return 'Todo{userId: $userId, id: $id, title: $title, completed: $completed}';
  }

  Todo copyWith({
    int? userId,
    int? id,
    String? title,
    bool? completed,
  }) {
    return Todo(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      title: title ?? this.title,
      completed: completed ?? this.completed,
    );
  }
}
