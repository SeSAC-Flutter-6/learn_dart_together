import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/post.dart';

class PostDataSource {
  static final _baseUrl = 'https://jsonplaceholder.typicode.com/posts';

  // Future<Post> getPost(int id) async {
  //   final http.Response response = await http.get(Uri.parse(_baseUrl));
  //   List jsonList = jsonDecode(response.body);
  //   return jsonList
  //       .map((e) => Post.fromJson(e))
  //       .toList()
  //       .firstWhere((post) => post.id == id);
  // }

  Future<Post> getPost(int id) async {
    final http.Response response = await http.get(Uri.parse('$_baseUrl/$id'));
    return Post.fromJson(jsonDecode(response.body));
  }

  Future<List<Post>> getPosts({int? page, int? limit}) async {
    final http.Response response = await http.get(Uri.parse(_baseUrl));
    List jsonList = jsonDecode(response.body);
    return jsonList.map((e) => Post.fromJson(e)).toList();
  }
}
