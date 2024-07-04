import 'package:dio/dio.dart';
import 'package:learn_dart_together/21_network/dto/todo_dto.dart';
import 'package:learn_dart_together/21_network/data_source/todo_api.dart';

class TodoApiImpl implements TodoApi {
  final Dio _dio;
  final String baseUrl;

  TodoApiImpl({required this.baseUrl})
      : _dio = Dio(BaseOptions(baseUrl: baseUrl));

  @override
  Future<List<TodoDto>> getTodos() async {
    try {
      Response response = await _dio.get('');
      if (response.statusCode == 200) {
        List<dynamic> jsonList = response.data;
        return jsonList.map((json) => TodoDto.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load todos');
      }
    } catch (e) {
      throw Exception('Error loading todos: $e');
    }
  }

  @override
  Future<TodoDto> createTodo(TodoDto dto) async {
    try {
      Response response = await _dio.post(
        '',
        data: dto.toJson(),
        options: Options(
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
          },
        ),
      );

      if (response.statusCode == 201) {
        return TodoDto.fromJson(response.data);
      } else {
        throw Exception('Failed to create todo');
      }
    } catch (e) {
      throw Exception('Error creating todo: $e');
    }
  }

  @override
  Future<TodoDto> updateTodo(int id, TodoDto dto) async {
    try {
      Response response = await _dio.put(
        '/$id',
        data: dto.toJson(),
        options: Options(
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
          },
        ),
      );

      if (response.statusCode == 200) {
        return TodoDto.fromJson(response.data);
      } else {
        throw Exception('Failed to update todo');
      }
    } catch (e) {
      throw Exception('Error updating todo: $e');
    }
  }

  @override
  Future<TodoDto> patchTodo(int id, Map<String, dynamic> fields) async {
    try {
      Response response = await _dio.patch(
        '/$id',
        data: fields,
        options: Options(
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
          },
        ),
      );

      if (response.statusCode == 200) {
        return TodoDto.fromJson(response.data);
      } else {
        throw Exception('Failed to patch todo');
      }
    } catch (e) {
      throw Exception('Error patching todo: $e');
    }
  }

  @override
  Future<void> deleteTodo(int id) async {
    try {
      Response response = await _dio.delete('/$id');

      if (response.statusCode != 200) {
        throw Exception('Failed to delete todo');
      }
    } catch (e) {
      throw Exception('Error deleting todo: $e');
    }
  }
}
