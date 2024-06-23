//데이터 소스를 받아서 내가 다루기 쉬운 형태로 바꾸어야해 -> class
//관계형 DB - RDBMS
//서버랑 통신할 때는 - toJson / fromJson
//json이 11폴더인데?
//pub.dev에서 라이브러리(패키지) 검색했을 때 Dart 3 compatible이 없으면 가능하ㅈ면 쓰지 말아라
//## http
//top level-function
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> main() async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));

  final jsonString = response.body;
  final json = jsonDecode(jsonString);

  print(json);
}

class Todo {
  int userId;
  int id;
  String title;
  bool completed;

  Todo({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  Todo.fromJson(Map<String, dynamic> json)
      : userId = json['userId'],
        id = json['id'],
        title = json['title'],
        completed = json['completed'];

  @override
  String toString() {
    return 'Todo{userId: $userId, id: $id, title: $title, completed: $completed}';
  }
}
