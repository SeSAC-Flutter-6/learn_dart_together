import 'package:learn_dart_together/18_model_repository/model/todos.dart';

abstract interface class TodoRepository {
  Future<List<Todos>> getTodos();

  Future<List<Todos>> getCompletedTodos();
}
