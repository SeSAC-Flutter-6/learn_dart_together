import 'package:learn_dart_together/12_data_source/data_source/todo_data_source.dart';
import 'package:learn_dart_together/12_data_source/data_source/user_data_source.dart';

Future<void> main() async {
  final users = await UserDataSource.getUsers();
  final todos = await TodoDataSource.getTodos();
  users.forEach((e) => print(e.toString()));
  todos.forEach((e) => print(e.toString()));
}