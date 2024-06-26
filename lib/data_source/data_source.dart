//데이터소스는 재료를 준다(카레,짜장,짬뽕국물..)- 미네랄
//데이터소스안에는 getTodo 같은 메서드가 있는데 얘네들은 소스를 가져온다
//레파짓토리(impl)는 재료를 가지고 가공을 한다(짜장밥, 짜장면, 카레밥, 카레라면, 짬뽕밥)-주방- 건물(도메인), 유닛(도메인)
//레시피는 impl 안에

import 'dart:convert';

import 'package:learn_dart_together/17_factory_singleton/model/album_model.dart';
import 'package:learn_dart_together/17_factory_singleton/model/comment_model.dart';
import 'package:http/http.dart' as http;

class CommentDataSource {
  Future<List<Comment>> getComments() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));
    final jsonStringList = response.body;
    final jsonList = jsonDecode(jsonStringList) as List;
    return jsonList.map((e) => Comment.fromJson(e)).toList();
  }

  Future<List<Comment>> getCommentsPostId(int postId) async {
    final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/comments/$postId'));
    final jsonStringList = response.body;
    final jsonList = jsonDecode(jsonStringList) as List;
    return jsonList.map((e) => Comment.fromJson(e)).toList();
  }
}

class AlbumDataSource {
  Future<List<Album>> getAlbums() async {
    final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/albums'));
    final jsonStringList = response.body;
    final jsonList = jsonDecode(jsonStringList) as List;
    return jsonList.map((e) => Album.fromJson(e)).toList();
  }

  // Future<List<Album>> getAlbumsTop10() async {
  //   final response = await http.get(
  //       Uri.parse('https://jsonplaceholder.typicode.com/albums'));
  //   final jsonStringList = response.body;
  //   final jsonList = jsonDecode(jsonStringList) as List;
  //   return jsonList.map((e) => Album.fromJson(e)).toList();
  // }
}
