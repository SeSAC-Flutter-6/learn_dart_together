import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:learn_dart_together/16_model_repository/model/album.dart';

class AlbumDataSource {
  Future<List<Album>> getAlbumList() async {
    final responseAlbum = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));
    final List<Album> albumList = jsonDecode(responseAlbum.body)
        .map<Album>((json) => Album.fromJson(json as Map<String, dynamic>))
        .toList();
    return albumList;
  }
}
