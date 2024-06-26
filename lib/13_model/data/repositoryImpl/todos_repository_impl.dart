import 'package:learn_dart_together/13_model/data/data_source/todos_data_source.dart';

import '../model/todos.dart';
import '../repository/todos_repository.dart';

class TodosRepositoryImpl implements TodosRepository {
  final TodosDataSource _todosDataSource;

  TodosRepositoryImpl(this._todosDataSource);

  @override
  Future<List<Todos>> getCompletedTodos() =>
      _todosDataSource.getCompletedTodos();

  @override
  Future<List<Todos>> getTodos() => _todosDataSource.getTodos();
}
