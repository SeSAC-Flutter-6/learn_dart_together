import 'dart:convert';
import 'package:learn_dart_together/14_datasource/asset.dart';
import 'package:learn_dart_together/14_datasource/subway.dart';
import 'package:learn_dart_together/14_datasource/todo.dart';
import 'package:learn_dart_together/14_datasource/user/user_info.dart';
import 'package:http/http.dart' as http;
import 'package:xml/xml.dart';

void main() async {
  print(await getTodo());
  print(await getTodoList());
  print(await getUserList());
  print(await getAssetList());
  print(await getSubwayList());
}

// 연습문제 1.
Future<Todo> getTodo() async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos/1'));
  final Map<String, dynamic> json = jsonDecode(response.body);
  return Todo.fromJson(json);
}

// 연습문제 2.
Future<List<Todo>> getTodoList() async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));
  final List json = jsonDecode(response.body);
  return json.map((e) => Todo.fromJson(e)).toList();
}

// 연습문제 3.
Future<List<UserInfo>> getUserList() async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
  final List json = jsonDecode(response.body);
  return json.map((e) => UserInfo.fromJson(e)).toList();
}

// 연습문제 4.
Future<List<Subway>> getSubwayList() async {
  final response = await http.get(Uri.parse(
      'http://swopenapi.seoul.go.kr/api/subway/sample/xml/realtimeStationArrival/0/5/%EC%84%9C%EC%9A%B8'));
  final xml =
      XmlDocument.parse(utf8.decode(response.bodyBytes)).findAllElements('row');
  return xml.map((e) => Subway.fromXml(e)).toList();
}

// 연습문제 5.
Future<List<Asset>> getAssetList() async {
  final response = await http.get(Uri.parse(
      'https://www.alphavantage.co/query?function=LISTING_STATUS&apikey=demo'));
  final list = response.body.split('\n');
  final csv = list.sublist(1, list.length - 1);
  return csv.map((e) => Asset.fromCsv(e.split(','))).toList();
}
