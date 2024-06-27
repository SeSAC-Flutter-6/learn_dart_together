import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:learn_dart_together/12_data_source/model/post.dart';

final class PostDataSource {
  Future<List<Post>> fetch() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    final List jsonList = jsonDecode(response.body);
    return jsonList.map((e) => Post.fromMap(e)).toList();
  }
}