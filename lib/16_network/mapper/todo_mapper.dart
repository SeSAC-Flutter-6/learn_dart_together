import 'package:learn_dart_together/16_network/dto/todo_dto.dart';
import 'package:learn_dart_together/16_network/model/todo.dart';

extension TodoMapper on TodoDto {
  Todo toTodo() {
    return Todo(
      userId: userId ?? -1,
      id: id ?? -1,
      title: title ?? '',
      completed: completed ?? false,
    );
  }
}
