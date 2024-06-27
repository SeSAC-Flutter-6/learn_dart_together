import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:learn_dart_together/13_model/data/model/todos.dart';

import '../model/post.dart';

class PostDataSource {
  static final _baseUrl = 'https://jsonplaceholder.typicode.com/posts';

  Future<Post> getPost(int id) async {
    final http.Response response = await http.get(Uri.parse('$_baseUrl/$id'));
    final Map<String, dynamic> json = jsonDecode(response.body);
    if (json.isEmpty) {
      throw Exception('json이 비어있습니다.');
    }

    return Post.fromJson(json);
  }

  Future<List<Post>> getPosts() async {
    final http.Response response = await http.get(Uri.parse(_baseUrl));
    final List jsonList = jsonDecode(response.body);

    return jsonList.map((posts) => Post.fromJson(posts)).toList();
  }
}
