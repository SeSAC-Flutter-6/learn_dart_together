import 'package:learn_dart_together/21_network/dto/todo_dto.dart';

abstract interface class TodoApi {
  Future<List<TodoDto>> getTodos();
  Future<TodoDto> createTodo(TodoDto todo);
  Future<TodoDto> updateTodo(int id, TodoDto todo);
  Future<TodoDto> patchTodo(int id, Map<String, dynamic> fields);
  Future<void> deleteTodo(int id);
}
