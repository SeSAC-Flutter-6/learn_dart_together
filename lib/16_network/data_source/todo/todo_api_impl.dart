import 'dart:convert';
import 'package:learn_dart_together/16_network/data_source/todo/todo_api.dart';
import 'package:learn_dart_together/16_network/dto/todo_dto/todo_dto.dart';
import 'package:http/http.dart' as http;

class TodoApiImpl implements TodoApi {
  final String _baseUrl;
  TodoApiImpl({String? baseUrl})
      : _baseUrl = baseUrl ?? 'https://jsonplaceholder.typicode.com/todos';

  @override
  Future<bool> createTodo(TodoDto dto) async {
    try {
      final Map<String, dynamic> todoJson = dto.toJson();
      final response = await http.post(
        Uri.parse(_baseUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(todoJson),
      );
      if (response.statusCode == 201) {
        print('Todo created successfully: ${response.body}');
        return true;
      } else {
        print('Failed to create todo: ${response.statusCode}');
        return false;
      }
    } catch (error) {
      print('Error creating user: $error');
      return false;
    }
  }

  @override
  Future<TodoDto?> getTodo(int id) async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl/$id'));

      if (response.statusCode == 200) {
        final Map<String, dynamic> json =
            jsonDecode(utf8.decode(response.bodyBytes));
        return TodoDto.fromJson(json);
      } else {
        throw Exception('Failed to load: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Error fetching: $error');
    }
  }

  @override
  Future<List<TodoDto>> getTodos() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));
      if (response.statusCode == 200) {
        final List jsonList = jsonDecode(utf8.decode(response.bodyBytes));
        return jsonList
            .map((e) => TodoDto.fromJson(e as Map<String, dynamic>))
            .toList();
      } else {
        print('Failed to load: ${response.statusCode}');
        return [];
      }
    } catch (error) {
      print('Error fetching: $error');
      return [];
    }
  }

  @override
  Future<TodoDto?> updateTodo(
      {required int id,
      int? updatedUserId,
      String? updatedTitle,
      bool? completed}) async {
    try {
      final Map<String, dynamic> todoJson = TodoDto(
              userId: updatedUserId, title: updatedTitle, completed: completed)
          .toJson();
      final response = await http.patch(
        Uri.parse('$_baseUrl/$id'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(todoJson),
      );
      if (response.statusCode == 200) {
        return TodoDto.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
      } else {
        print('Failed to create todo: ${response.statusCode}');
        return null;
      }
    } catch (error) {
      print('Error creating user: $error');
      return null;
    }
  }

  @override
  Future<bool> deleteTodo(int id) async {
    try {
      final response = await http.delete(Uri.parse('$_baseUrl/$id'));
      if (response.statusCode == 200) {
        print('Todo deleted successfully');
        return true;
      } else {
        print('Failed to delete todo: ${response.statusCode}');
        return false;
      }
    } catch (error) {
      print('Error creating user: $error');
      return false;
    }
  }
}
