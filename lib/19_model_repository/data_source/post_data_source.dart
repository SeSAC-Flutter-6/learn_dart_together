import 'dart:convert';

import 'package:learn_dart_together/19_model_repository/model/post.dart';
import 'package:http/http.dart' as http;

class PostDataSource {
  Future<List<Post>> getData() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    final data = jsonDecode(response.body) as List;
    return data.map((e) => Post.fromJson(e)).toList();
  }
}
