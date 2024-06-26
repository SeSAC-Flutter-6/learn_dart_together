import 'package:learn_dart_together/13_model_repository/data/data_source/todo_api.dart';
import 'package:learn_dart_together/13_model_repository/data/model/todo.dart';
import 'package:learn_dart_together/13_model_repository/data/repository/todo_repository.dart';

class TodoRepositoryImpl implements TodoReopository {
  final _todoApi = TodoApi();

  @override
  Future<List<Todo>> getTodos() async {
    try {
      final List<dynamic> todoDataList = await _todoApi.fetchAllData();
      return todoDataList.map<Todo>((json) => Todo.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to getAlbums: $e');
    }
  }

  @override
  Future<List<Todo>> getCompletedTodos() async {
    try {
      final List<dynamic> todoDataList = await _todoApi.fetchAllData();

      final List<Todo> completedTodos = todoDataList
          .where((json) => json['completed'] == true) // JSON 데이터에서 필터링
          .map<Todo>((json) => Todo.fromJson(json)) // 필터링된 데이터를 모델링
          .toList();
      //거꾸로보다는 이 방법이 좀 더 낫다.
    } catch (e) {
      throw Exception('Failed to getAlbums: $e');
    }
  }
}
