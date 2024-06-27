import 'dart:convert';

import 'package:http/http.dart' as http;

class BaseDataSource {
  Future<T> fetchDataSingle<T>(
      String url, T Function(dynamic) fromJson, int id) async {
    final response = await http.get(Uri.parse('$url/$id'));
    if (response.statusCode == 200) {
      return fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<List<T>> fetchData<T>(String url, T Function(dynamic) fromJson) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return (jsonDecode(response.body) as List)
          .map((itemJson) => fromJson(itemJson))
          .toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}
