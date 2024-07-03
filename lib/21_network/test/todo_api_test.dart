import 'package:learn_dart_together/21_network/data_source/todo_api_impl.dart';
import 'package:learn_dart_together/21_network/dto/todo_dto.dart';
import 'package:test/test.dart';

void main() {
  final String mockServerUrl =
      'https://0dfb2eff-f41e-41e7-8fd8-2eac217b4c74.mock.pstmn.io/todos';

  final TodoApiImpl mockServer = TodoApiImpl(baseUrl: mockServerUrl);

  group('TodoApiImpl 테스트', () {
    test('getTodos 성공', () async {
      final todos = await mockServer.getTodos();
      expect(todos, isNotNull);
      expect(todos.isNotEmpty, true);
    });

    test('createTodo 성공', () async {
      final newTodo = TodoDto(userId: 1, title: '새로운 할 일', completed: false);
      final result = await mockServer.createTodo(newTodo);
      expect(result, isNotNull);
      expect(result.userId, newTodo.userId);
      expect(result.title, newTodo.title);
      expect(result.completed, newTodo.completed);
    });
  });
}
