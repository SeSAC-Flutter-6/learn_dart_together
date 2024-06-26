import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/comment.dart';




class CommentDataSource {
  Future<List<Comment>> getData()async{
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));
    final data = jsonDecode(response.body) as List;
    return data.map((e)=>Comment.fromJson(e)).toList();
  }
}