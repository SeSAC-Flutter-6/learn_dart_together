import 'package:http/http.dart' as http; // as 안하면 바로 함수 쓸 수 있음 그러나 의미부여를 위해 이름을 설정해 준다.
import 'package:learn_dart_together/data_source/todo_data_source.dart';
import 'package:learn_dart_together/data_source/todo_list_data_source.dart';
import 'package:learn_dart_together/data_source/user_list_data_source.dart';

void main() async {
  print(await TodoDataSource().getTodo());
  print(await TodoListDataSource().getTodoList());
  print(await UserDataSource().getUserList());
}
