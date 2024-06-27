import 'package:learn_dart_together/15_model_respository/data_source/todo_data_source.dart';
import '../../14_datasource/todo.dart';

abstract interface class TodoRepository {
  Future<List<Todo>> getTodos();
  Future<List<Todo>> getCompletedTodos();
}

class TodoRepositoryImpl implements TodoRepository {
  final _dataSource = TodoDataSource();

  @override
  Future<List<Todo>> getTodos() async {
    return await _dataSource.fetchTodos();
  }

  @override
  Future<List<Todo>> getCompletedTodos() async {
    return (await getTodos()).where((e) => e.completed == true).toList();
  }
}
