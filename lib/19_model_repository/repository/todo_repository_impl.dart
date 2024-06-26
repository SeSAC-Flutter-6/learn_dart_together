import 'package:learn_dart_together/19_model_repository/data_source/todo_data_source.dart';
import 'package:learn_dart_together/19_model_repository/model/todo.dart';
import 'package:learn_dart_together/19_model_repository/repository/todo_repository.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoDataSource _todoDataSource;

  TodoRepositoryImpl(this._todoDataSource);

  @override
  Future<List<Todo>> getTodos() async {
    return await _todoDataSource.getData();
  }

  @override
  Future<List<Todo>> getCompletedTodos() async {
    final data = await _todoDataSource.getData();
    return data.where((e) => e.completed == true).toList();
  }
}
