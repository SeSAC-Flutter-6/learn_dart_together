import 'package:learn_dart_together/13_model/data/data_source/todos_data_source.dart';

import '../model/todos.dart';
import '../repository/todos_repository.dart';

class TodosRepositoryImpl implements TodosRepository {
  final TodosDataSource _todosDataSource;

  TodosRepositoryImpl(this._todosDataSource);

  @override
  Future<List<Todos>> getCompletedTodos() async {
    final todos = await _todosDataSource.getTodos();
    return todos.where((todo) => todo.completed == true).toList();
  }

  @override
  Future<List<Todos>> getTodos() => _todosDataSource.getTodos();
}
