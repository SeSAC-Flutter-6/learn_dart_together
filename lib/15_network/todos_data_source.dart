import 'todo_dto.dart';

abstract interface class TodosDataSource {
  Future<bool> createTodo(TodoDTO todo);
  Future<List<TodoDTO>> getTodos();
  Future<TodoDTO?> getTodo(int id);
  Future<TodoDTO?> updateTodo({required int id, int? updatedUserId, String? updatedTitle, bool? completed});
  Future<bool> deleteTodo(int id);
}