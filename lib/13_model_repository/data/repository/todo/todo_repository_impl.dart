import 'package:learn_dart_together/13_model_repository/data/data_source/todo_api.dart';
import 'package:learn_dart_together/13_model_repository/data/model/todo.dart';
import 'package:learn_dart_together/13_model_repository/data/repository/todo/todo_repository.dart';

class TodoRepositoryImpl implements TodoReopository {
  final _todoApi = TodoApi();

  @override
  Future<List<Todo>> getTodos() async {
    try {
      final List<dynamic> todoDataList = await _todoApi.fetchAllData();
      return todoDataList.map<Todo>((json) => Todo.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to getTodos: $e');
    }
  }

  @override
  Future<List<Todo>> getCompletedTodos() async {
    try {
      final List<dynamic> todoDataList = await _todoApi.fetchAllData();
      return todoDataList
          .where((json) => json['completed'] == true)
          .map<Todo>((json) => Todo.fromJson(json))
          .toList();
    } catch (e) {
      throw Exception('Failed to getCompletedTodos: $e');
    }
  }
}
