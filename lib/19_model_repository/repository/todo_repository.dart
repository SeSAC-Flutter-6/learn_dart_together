import 'package:learn_dart_together/19_model_repository/model/todo.dart';

abstract interface class TodoRepository {
  Future<List<Todo>> getTodos();

  Future<List<Todo>> getCompletedTodos();
}
