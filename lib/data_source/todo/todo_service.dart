import 'package:learn_dart_together/12_data_source/todo.dart';

abstract interface class ToDoService {
  Future<Todo> getToDo({required int todoId});
  Future<List<Todo>> getToDoList();
}
