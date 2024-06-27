import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/post.dart';

class PostDataSource {
  Future<List<Post>> getPostList() async {
    final responsePost =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    final List<Post> postList = jsonDecode(responsePost.body)
            .map<Post>((json) => Post.fromJson(json as Map<String, dynamic>))
            .toList() ??
        [];
    return postList;
  }
}
