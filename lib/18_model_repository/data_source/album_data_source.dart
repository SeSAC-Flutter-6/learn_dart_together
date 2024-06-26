import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:learn_dart_together/18_model_repository/model/albums.dart';

class AlbumsApi {
  Future<List<Album>> getAlbums() async {
    final http.Response response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));

    final List jsonList = jsonDecode(response.body) as List;

    return jsonList.map((e) => Album.fromJson(e)).toList();
  }

  Future<List<Album>> getAlbumsTop10() async {
    final http.Response response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/albums?_limit=10'));

    final List<dynamic> jsonList = jsonDecode(response.body);

    return jsonList.map((e) => Album.fromJson(e)).toList();
  }
}

void main() async {
  AlbumsApi albumsApi = AlbumsApi();
  try {
    List<Album> albums = await albumsApi.getAlbums(); // 수정: 인스턴스를 사용하여 호출
    print(albums);
  } catch (e) {
    print('Error: $e');
  }
}
