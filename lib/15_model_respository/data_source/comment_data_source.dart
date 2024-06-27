import 'dart:convert';
import '../model/comment.dart';
import 'package:http/http.dart' as http;

class CommentDataSource {
  Future<List<Comment>> fetchComments() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));
    final List jsonList = jsonDecode(response.body);
    return jsonList.map((e) => Comment.fromJson(e)).toList();
  }
}
