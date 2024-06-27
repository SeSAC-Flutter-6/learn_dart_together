import 'dart:convert';

import '../model/todo.dart';
import 'package:http/http.dart' as http;

class TodoDataSource {
  static final _baseUrl = 'https://jsonplaceholder.typicode.com/todos';

  Future<List<Todo>> getTodos() async {
    final http.Response response = await http.get(Uri.parse(_baseUrl));
    List jsonList = jsonDecode(response.body);
    return jsonList.map((e) => Todo.fromJson(e)).toList();
  }
}
