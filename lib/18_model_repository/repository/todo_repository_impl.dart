import 'package:learn_dart_together/18_model_repository/data_source/todos_data_source.dart';
import 'package:learn_dart_together/18_model_repository/model/todos.dart';
import 'package:learn_dart_together/18_model_repository/repository/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  @override
  Future<List<Todos>> getCompletedTodos() async {
    TodoApi todoApi = TodoApi();
    final List<Todos> todos = await todoApi.getTodos();
    final List<Todos> completedtodos =
        todos.where((e) => e.completed == true).toList();
    return completedtodos;
  }

  @override
  Future<List<Todos>> getTodos() async {
    TodoApi todoApi = TodoApi();
    return todoApi.getTodos();
  }
}
