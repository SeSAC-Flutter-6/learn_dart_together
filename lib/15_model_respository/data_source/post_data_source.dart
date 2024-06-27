import 'dart:convert';
import 'package:learn_dart_together/15_model_respository/model/post.dart';
import 'package:http/http.dart' as http;

class PostDataSource {
  Future<List<Post>> fetchPosts() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    final List jsonList = jsonDecode(response.body);
    return jsonList.map((e) => Post.fromJson(e)).toList();
  }
}
