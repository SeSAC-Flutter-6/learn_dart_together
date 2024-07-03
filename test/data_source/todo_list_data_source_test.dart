import 'package:learn_dart_together/18_data_source/todo.dart';
import 'package:learn_dart_together/data_source/todo_list_data_source.dart';
import 'package:test/test.dart';

void main() {
  test('목서버에서 get 해온 데이터 비교', () async {
    final mockServerUrl =
        'https://0f7b0da4-a1dc-4d4a-8b98-a38c3b4efd28.mock.pstmn.io/todos';
    final data = [
      {"userId": 1, "id": 1, "title": "delectus aut autem", "completed": false},
      {
        "userId": 1,
        "id": 2,
        "title": "quis ut nam facilis et officia qui",
        "completed": false
      },
      {
        "userId": 1,
        "id": 3,
        "title": "fugiat veniam minus",
        "completed": false
      },
      {"userId": 1, "id": 4, "title": "et porro tempora", "completed": true},
      {
        "userId": 1,
        "id": 5,
        "title":
            "laboriosam mollitia et enim quasi adipisci quia provident illum",
        "completed": false
      }
    ];
    final mockServerData =
        await TodoListDataSource(baseUrl: mockServerUrl).getTodoList();
    final testData = data.map((e) => Todo.fromJson(e)).toList();
    expect(mockServerData, testData);
  });
}
