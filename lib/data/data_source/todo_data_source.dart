import 'dart:convert';

import '../../15_datasource/main.dart';
import 'package:http/http.dart' as http;

class TodoDataSource {
  Future<List<Todo>> getData() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));
    final data = jsonDecode(response.body) as List;
    return data.map((e) => Todo.fromJson(e)).toList();
  }
}
