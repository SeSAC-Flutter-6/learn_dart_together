import 'package:learn_dart_together/16_model_repository/datasource/todo_data_source.dart';
import 'package:learn_dart_together/16_model_repository/model/todo.dart';
import 'package:learn_dart_together/16_model_repository/repository/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoDataSource _todoDataSource;

  TodoRepositoryImpl(this._todoDataSource);

  @override
  Future<List<Todo>> getTodos() => _todoDataSource.getTodos();

  @override
  Future<List<Todo>> getCompletedTodos() async {
    List<Todo> todo = await _todoDataSource.getTodos();
    return todo.where((e) => e.completed == false).toList();
  }
}
