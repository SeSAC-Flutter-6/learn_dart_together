import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:learn_dart_together/18_model_repository/model/posts.dart';

class PostApi {
  Future<List<Post>> getPosts() async {
    final http.Response response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

    final List jsonList = jsonDecode(response.body) as List;

    return jsonList.map((e) => Post.fromJson(e)).toList();
  }
}
