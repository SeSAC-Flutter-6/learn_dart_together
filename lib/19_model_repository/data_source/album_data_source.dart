import 'dart:convert';

import 'package:learn_dart_together/19_model_repository/model/album.dart';
import 'package:http/http.dart' as http;

class AlbumDataSource {
  Future<List<Album>> getData() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));
    final data = jsonDecode(response.body) as List;
    return data.map((e) => Album.fromJson(e)).toList();
  }
}
