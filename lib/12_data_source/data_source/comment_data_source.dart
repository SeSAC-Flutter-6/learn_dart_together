import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:learn_dart_together/12_data_source/model/comment.dart';


final class CommentDataSource {
  Future<List<Comment>> getComments(int postId) async {
    final http.Response response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));
    List jsonList = jsonDecode(response.body);
    return jsonList.map((e) => Comment.fromJson(e)).toList();
  }
}