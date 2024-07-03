import 'package:learn_dart_together/21_network/model/todo.dart';
import 'package:learn_dart_together/21_network/dto/todo_dto.dart';

extension TodoMapper on TodoDto {
  Todo toTodo() {
    return Todo(
      userId: userId ?? 0,
      id: id ?? 0,
      title: title ?? "",
      completed: completed ?? false,
    );
  }
}
