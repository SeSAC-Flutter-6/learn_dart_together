import 'dart:convert';
import 'package:fast_csv/csv_converter.dart';
import 'package:http/http.dart' as http;
import 'package:learn_dart_together/12_data_source/todo/todo.dart';
import 'package:learn_dart_together/12_data_source/user/user.dart';
import 'package:xml/xml.dart';

import '../12_data_source/status/status.dart';
import '../12_data_source/subway/subway.dart';

class TodoDataSource {
  Future<List<Todo>> getTodos() async {
    final http.Response response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));

    List jsonList = jsonDecode(response.body);

    return jsonList.map((e) => Todo.fromJson(e)).toList();
  }

  Future<Todo> getTodo(int id) async {
    final http.Response response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/todos/$id'));

    final Map<String, dynamic> json = jsonDecode(response.body);
    return Todo.fromJson(json);
  }

  Future<List<User>> getUsers() async {
    final http.Response response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    List jsonList = jsonDecode(response.body);

    return jsonList.map((e) => User.fromJson(e)).toList();
  }

  Future<List<Subway>> getSubways() async {
    final http.Response response = await http.get(Uri.parse(
        'http://swopenapi.seoul.go.kr/api/subway/sample/xml/realtimeStationArrival/0/5/%EC%84%9C%EC%9A%B8'));

    final utfDecode = utf8.decode(response.bodyBytes);
    final xmlData = XmlDocument.parse(utfDecode);
    final rowData = xmlData.findAllElements('row');

    return rowData.map((element) => Subway.fromXml(element)).toList();
  }

  Future<List<Status>> getStatuses() async {
    final http.Response response = await http.get(Uri.parse(
        'https://www.alphavantage.co/query?function=LISTING_STATUS&apikey=demo'));
    final data = CsvConverter().convert(response.body);
    final List<String> fields = [
      'symbol',
      'name',
      'exchange',
      'assetType',
      'ipoDate',
      'delistingDate',
      'status'
    ];

    List<Map<String, dynamic>> jsonList = [];
    for (var row in data) {
      Map<String, dynamic> map = {};
      for (int i = 0; i < fields.length; i++) {
        map[fields[i]] = row[i];
      }
      jsonList.add(map);
    }

    return jsonList.map((element) => Status.fromJson(element)).toList();
  }
}
