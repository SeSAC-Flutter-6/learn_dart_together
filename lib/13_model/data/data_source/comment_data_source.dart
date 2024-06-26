import 'dart:convert';

import 'package:http/http.dart' as http;
import '../model/comment.dart';

class CommentDataSource {
  static final _baseUrl = 'https://jsonplaceholder.typicode.com/comments';

  Future<List<Comment>> getComments() async {
    final http.Response response = await http.get(Uri.parse(_baseUrl));
    final List jsonList = jsonDecode(response.body);

    return jsonList.map((comment) => Comment.fromJson(comment)).toList();
  }
}
