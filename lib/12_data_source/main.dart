// ignore_for_file: unused_local_variable
import 'package:learn_dart_together/12_data_source/realtime_station_arrival.dart';
import 'package:learn_dart_together/12_data_source/stock.dart';
import 'package:learn_dart_together/12_data_source/todo.dart';
import 'package:learn_dart_together/12_data_source/user.dart';
import 'package:learn_dart_together/data_source/stock/stock_service_impl.dart';
import 'package:learn_dart_together/data_source/subway/subway_service_impl.dart';
import 'package:learn_dart_together/data_source/todo/todo_service_impl.dart';
import 'package:learn_dart_together/data_source/user/user_service_impl.dart';

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

  // csv 파싱시간비교
  await compareCsvParsingPerformance(stockService);

  //xml 파싱시간비교
  await compareXmlParsingPerformance(subwayService);
}

Future<void> compareCsvParsingPerformance(StockServiceImpl stockService) async {
  try {
    final Stopwatch stopwatch1 = Stopwatch()..start();
    List<Stock> stocksDirectParsing = await stockService.getStockAndETFList();
    stopwatch1.stop();
    print('직접 csv 파싱: ${stopwatch1.elapsedMilliseconds} ms');

    final Stopwatch stopwatch2 = Stopwatch()..start();
    List<Stock> stocksUsingCsvPackage =
        await stockService.getStockAndETFListUsingCsvPackage();
    stopwatch2.stop();
    print('csv패키지 사용: ${stopwatch2.elapsedMilliseconds} ms');
  } catch (e) {
    print('Error: $e');
  }
}

Future<void> compareXmlParsingPerformance(
    SubwayServiceImpl subwayService) async {
  try {
    final Stopwatch stopwatch1 = Stopwatch()..start();
    List<RealtimeStationArrival> resultDirectParsing =
        await subwayService.getRealtimeStationArrival(
            startIndex: '0', endIndex: '5', statnNm: '서울');
    stopwatch1.stop();
    print('직접 XML 파싱: ${stopwatch1.elapsedMilliseconds} ms');

    final Stopwatch stopwatch2 = Stopwatch()..start();
    List<RealtimeStationArrival> resultUsingPackage =
        await subwayService.getRealtimeStationArrivalUsingXmlPackage(
            startIndex: '0', endIndex: '5', statnNm: '서울');
    stopwatch2.stop();
    print('xml 패키지 사용: ${stopwatch2.elapsedMilliseconds} ms');
  } catch (e) {
    print('Error: $e');
  }
}
