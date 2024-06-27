import 'package:learn_dart_together/13_model_repository/data/model/todo.dart';

abstract interface class TodoReopository {
  Future<List<Todo>> getTodos();
  Future<List<Todo>> getCompletedTodos();
}
