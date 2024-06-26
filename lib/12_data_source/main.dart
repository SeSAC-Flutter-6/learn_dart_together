import 'package:learn_dart_together/12_data_source/realtime_station_arrival.dart';
import 'package:learn_dart_together/12_data_source/stock.dart';
import 'package:learn_dart_together/13_model_repository/data/model/todo.dart';
import 'package:learn_dart_together/13_model_repository/data/model/user.dart';
import 'package:learn_dart_together/12_data_source/data_source/stock/stock_service_impl.dart';
import 'package:learn_dart_together/12_data_source/data_source/subway/subway_service_impl.dart';
import 'package:learn_dart_together/12_data_source/data_source/todo/todo_service_impl.dart';
import 'package:learn_dart_together/12_data_source/data_source/user/user_service_impl.dart';

Future<void> main() async {
  final todoService = TodoServiceImpl();
  final userService = UserServiceImpl();
  final subwayService = SubwayServiceImpl();
  final stockService = StockServiceImpl();

  //문제 1
  Todo todo1 = await todoService.getToDo(todoId: 1);
  print(todo1);

  //문제 2
  List<Todo> todoList = await todoService.getToDoList();
  for (Todo todo in todoList) {
    print(todo);
  }

  // 문제 3
  User user1 = await userService.getUser(userId: 1);
  print(user1);

  List<User> userList = await userService.getUserList();
  for (User user in userList) {
    print(user);
  }

  // 문제 4
  List<RealtimeStationArrival> dataList =
      await subwayService.getRealtimeStationArrival(
          startIndex: 0.toString(), endIndex: 5.toString(), statnNm: '서울');
  for (RealtimeStationArrival data in dataList) {
    print(data);
  }

  // 문제 5
  List<Stock> stocks = await stockService.getStockAndETFList();
  for (Stock stock in stocks) {
    print(stock);
  }
}
