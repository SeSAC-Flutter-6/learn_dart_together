import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:learn_dart_together/16_model_repository/model/comment.dart';

class CommentsDataSource {
  Future<List<Comment>> getCommentList() async {
    final responseComment = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));
    final List<Comment> commentList = jsonDecode(responseComment.body)
        .map<Comment>(
            (json) => Comment.fromJson((json as Map<String, dynamic>)))
        .toList();
    return commentList;
  }
}
