import 'package:learn_dart_together/16_data_source/todo_data_source.dart';
import 'package:learn_dart_together/16_data_source/users_data_source.dart';
import 'package:learn_dart_together/data_source/alphavantage_data_source.dart';

import '../data_source/subway_data_source.dart';

void main() async {
  final todo = await TodoDataSource().getTodo();
  final todoList = await TodoDataSource().getTodoList();
  final userList = await UsersDataSource().getUserList();
  final seoulSubway = await SubwayDataSource().getSeoulSubway();
  // print(seoulSubway);
  final stockList = (await StockDataSource().getStockList());
  stockList.removeAt(0);
  print(stockList[0]);
}
