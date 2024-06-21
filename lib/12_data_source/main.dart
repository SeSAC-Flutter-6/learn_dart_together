import 'package:learn_dart_together/12_data_source/todo.dart';
import 'package:learn_dart_together/12_data_source/user.dart';
import 'package:learn_dart_together/data_source/todo/todo_service_impl.dart';
import 'package:learn_dart_together/data_source/user/user_service_impl.dart';

Future<void> main() async {
  final todoService = TodoServiceImpl();
  final userService = UserServiceImpl();

  //문제 1
  Todo todo1 = await todoService.getToDo(todoId: 1);
  print(todo1);

  //문제 2
  List<Todo> todoList = await todoService.getToDoList();
  for (Todo todo in todoList) {
    print(todo);
  }

  // 문제 3
  User user1 = await userService.getUser(userId: 1);
  print(user1);

  List<User> userList = await userService.getUserList();
  for (User user in userList) {
    print(user);
  }
}
