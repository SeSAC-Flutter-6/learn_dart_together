import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:learn_dart_together/13_model/data/model/todos.dart';

class TodosDataSource {
  static final _baseUrl = 'https://jsonplaceholder.typicode.com/todos';

  Future<List<Todos>> getTodos() async {
    final http.Response response = await http.get(Uri.parse(_baseUrl));
    final List jsonList = jsonDecode(response.body);

    return jsonList.map((todos) => Todos.fromJson(todos)).toList();
  }

  Future<List<Todos>> getCompletedTodos() async {
    final http.Response response = await http.get(Uri.parse(_baseUrl));
    final List jsonList = jsonDecode(response.body);

    return jsonList
        .map((todos) => Todos.fromJson(todos))
        .where((todo) => todo.completed == true)
        .toList();
  }
}
