import 'package:learn_dart_together/16_network/dto/todo_dto/todo_dto.dart';

abstract interface class TodoApi {
  Future<bool> createTodo(TodoDto todo);
  Future<List<TodoDto>> getTodos();
  Future<TodoDto?> getTodo(int id);
  Future<TodoDto?> updateTodo({required int id, int? updatedUserId, String? updatedTitle, bool? completed});
  Future<bool> deleteTodo(int id);
}
