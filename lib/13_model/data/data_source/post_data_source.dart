import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:learn_dart_together/13_model/data/model/todos.dart';

import '../model/post.dart';

class PostDataSource {
  static final _baseUrl = 'https://jsonplaceholder.typicode.com/posts';

  Future<Post> getPost(int id) async {
    final http.Response response = await http.get(Uri.parse(_baseUrl));
    final List jsonList = jsonDecode(response.body);

    return jsonList
        .map((posts) => Post.fromJson(posts))
        .where((post) => post.id == id)
        .first;
  }

  Future<List<Post>> getPosts({int? page, int? limit}) async {
    final http.Response response = await http.get(Uri.parse(_baseUrl));
    final List jsonList = jsonDecode(response.body);

    return jsonList.map((posts) => Post.fromJson(posts)).toList();
  }
}
