import './todo_repository.dart';
import '../model/todo.dart';
import 'package:learn_dart_together/data_source/base_data_source.dart';

class TodoRepositoryImpl implements TodoRepository {
  final BaseDataSource _baseDataSource;

  TodoRepositoryImpl(this._baseDataSource);

  @override
  Future<List<Todo>> getTodos() async {
    return _baseDataSource.fetchData<Todo>(
      'https://jsonplaceholder.typicode.com/todos',
      (json) => Todo.fromJson(json),
    );
  }

  @override
  Future<List<Todo>> getCompletedTodos() async {
    List<Todo> allTodos = await getTodos();
    return allTodos.where((todo) => todo.completed).toList();
  }
}
