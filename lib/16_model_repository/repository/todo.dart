import '../../16_data_source/todo_data_source.dart';
import '../data_source/comments.dart';

class TodoRepositoryImpl implements TodoRepository {
  @override
  Future<List<Todo>> getTodos() async {
    final results = await TodoDataSource().getTodoList();
    return results;
  }

  @override
  Future<List<Todo>> getCompletedTodos() async {
    final results = await TodoDataSource().getTodoList();
    final List<Todo> filteredTodos = results.where((todo) => todo.completed).toList();
    return filteredTodos;
  }
}

abstract interface class TodoRepository {
  Future<List<Todo>> getTodos();

  Future<List<Todo>> getCompletedTodos();
}
