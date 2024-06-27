import 'package:learn_dart_together/13_model/data/model/todos.dart';

abstract interface class TodosRepository {
  Future<List<Todos>> getTodos();

  Future<List<Todos>> getCompletedTodos();
}
