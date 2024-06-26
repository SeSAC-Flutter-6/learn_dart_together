// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:learn_dart_together/data_source/todo_data_source.dart';
import 'package:learn_dart_together/data_source/user_data_source.dart';
import 'user.dart';
import 'todo.dart';

void main() async {
  print(await TodoDataSource().getTodo(2));
  print('\n');

  List<Todo> todos = await TodoDataSource().getTodos();
  todos.forEach(print);
  print('\n');

  List<User> users = await UserDataSource().getUsers();
  users.forEach(print);
}
