import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:learn_dart_together/19_model_repository/model/photo.dart';

class PhotoDataSource {
  Future<List<Photo>> getData() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    final data = jsonDecode(response.body) as List;
    return data.map((e) => Photo.fromJson(e)).toList();
  }
}
