import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:learn_dart_together/15_data_source/data_source/todolist_data_source.dart';

Future<Todo> getTodo(int id) async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/todos/$id'));

  final jsonString = response.body;
  final json = jsonDecode(jsonString);
  return Todo.fromJson(json);

  print(json);
}

void main() {
  getTodo(2).then((e) => print(e));
}
