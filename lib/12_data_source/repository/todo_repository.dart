import 'package:learn_dart_together/12_data_source/data_source/todo_data_source.dart';
import 'package:learn_dart_together/12_data_source/dto/todo.dart';

abstract interface class TodoRepository {
  Future<List<Todo>> getTodos();
  Future<List<Todo>> getCompletedTodos();
}

final class TodoRepositoryImpl implements TodoRepository {
  final TodoDataSource _todoDataSource;

  TodoRepositoryImpl(this._todoDataSource);

  @override
  Future<List<Todo>> getCompletedTodos() => _todoDataSource.getTodos();

  @override
  Future<List<Todo>> getTodos() => _todoDataSource.getCompletedTodos();

}