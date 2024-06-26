import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:learn_dart_together/12_data_source/todo/todo.dart';

void main() async {
  http
      .get(Uri.parse('https://jsonplaceholder.typicode.com//todos/1'))
      .then((response) => jsonDecode(response.body))
      .then((json) => print(json));

  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com//todos/1'));
  final json = jsonDecode(response.body);
  print(Todo.fromJson(json));
}
