
import 'package:learn_dart_together/15_network/todo_dto.dart';
import 'package:learn_dart_together/15_network/todos_data_source_impl.dart';
import 'package:test/test.dart';

void main() {
  final TodosDataSourceImpl dataSource = TodosDataSourceImpl(baseUrl: 'https://0dfb2eff-f41e-41e7-8fd8-2eac217b4c74.mock.pstmn.io/todos');

  group('TodosDataSourceImpl 테스트', () {
    test('getTodos 성공', () async {
      final todos = await dataSource.getTodos();
      expect(todos, isNotNull);
      expect(todos.isNotEmpty, true);
    });

    test('getTodo 성공', () async {
      final todo = await dataSource.getTodo(1);
      expect(todo, isNotNull);
      expect(todo!.id, 1);
    });

    test('createTodo 성공', () async {
      final newTodo = TodoDTO(userId: 1, title: '새로운 할 일', completed: false);
      final result = await dataSource.createTodo(newTodo);
      expect(result, true);
    });

    test('updateTodo 성공', () async {
      final result = await dataSource.updateTodo(
        id: 1,
        updatedTitle: '수정된 할 일',
        completed: true,
      );
      expect(result, isNotNull);
      expect(result!.title, '수정된 할 일');
    });

    test('deleteTodo 성공', () async {
      final result = await dataSource.deleteTodo(1);
      expect(result, true);
    });
  });
}
