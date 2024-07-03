import 'package:learn_dart_together/16_network/data_source/todo/todo_api.dart';
import 'package:learn_dart_together/16_network/data_source/todo/todo_api_impl.dart';
import 'package:learn_dart_together/16_network/dto/todo_dto.dart';
import 'package:learn_dart_together/16_network/mapper/todo_mapper.dart';
import 'package:learn_dart_together/16_network/model/todo.dart';
import 'package:test/test.dart';

void main() {
  group('Mock서버 테스트(mock 서버를 실서버와 동일한 데이터를 주도록 구축 후 두개가 정말 동일한 데이터를 주는지 검증)',
      () {
    late TodoApi todoApi;
    late TodoApi mockTodoApi;
    final String mockServerUrl =
        'https://53508a21-252c-4a50-89c0-9c14a4591089.mock.pstmn.io';

    setUp(() {
      todoApi = TodoApiImpl();
      mockTodoApi = TodoApiImpl(baseUrl: mockServerUrl);
    });

    test('getTodos', () async {
      List<TodoDto> dtoList = await todoApi.getTodos();
      List<Todo> todos = dtoList.map((dto) => dto.toTodo()).toList();

      List<TodoDto> mockDtoList = await mockTodoApi.getTodos();
      List<Todo> mockTodos = mockDtoList.map((dto) => dto.toTodo()).toList();

      expect(todos.toString(), mockTodos.toString());
    });
  });
}
