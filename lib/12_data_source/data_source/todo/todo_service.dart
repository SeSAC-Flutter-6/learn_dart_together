import 'package:learn_dart_together/13_model_repository/data/model/todo.dart';

abstract interface class ToDoService {
  Future<Todo> getToDo({required int todoId});
  Future<List<Todo>> getToDoList();
}
