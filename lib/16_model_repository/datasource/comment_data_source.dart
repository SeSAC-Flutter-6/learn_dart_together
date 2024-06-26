import 'dart:convert';

import '../model/comment.dart';
import 'package:http/http.dart' as http;

class CommentDataSource {
  static final _baseUrl = 'https://jsonplaceholder.typicode.com/comments';

  Future<List<Comment>> getComments(int postId) async {
    final http.Response response = await http.get(Uri.parse(_baseUrl));
    List jsonList = jsonDecode(response.body);
    return jsonList.map((e) => Comment.fromJson(e)).toList();
  }
}
