import 'package:learn_dart_together/16_data_source/todo_data_source.dart';
import 'package:learn_dart_together/16_data_source/users_data_source.dart';
import 'package:learn_dart_together/data_source/alphavantage_data_source.dart';

import '../data_source/subway_data_source.dart';

void main() async {
  final String mockServerUrl =
      'https://bab5e11f-b20c-4f86-8db9-e80b25046a3e.mock.pstmn.io';
  final todo = await TodoDataSource(baseUrl: mockServerUrl).getTodo(id: 1);
  // print(todo);
  final todoList = await TodoDataSource(baseUrl: mockServerUrl).getTodoList();
  // print(todoList);
  final todoDeleted =
      await TodoDataSource(baseUrl: mockServerUrl).deleteTodo(id: 2);
  // print(todoDeleted);
  final todoCreated = await TodoDataSource(baseUrl: mockServerUrl).createTodo();
  // print(todoCreated);
  final updateTodo =
      await TodoDataSource(baseUrl: mockServerUrl).updateTodo(id: 1);
  // print(updateTodo);
  final userList = await UsersDataSource().getUserList();
  final seoulSubway = await SubwayDataSource().getSeoulSubway();
  // print(seoulSubway);
  final stockList = (await StockDataSource().getStockList());
  // stockList.removeAt(0);
  // print(stockList[0]);
}
