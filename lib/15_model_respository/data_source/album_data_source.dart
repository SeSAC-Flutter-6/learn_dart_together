import 'dart:convert';
import 'package:learn_dart_together/15_model_respository/model/album.dart';
import 'package:http/http.dart' as http;

class AlbumDataSource {
  Future<List<Album>> fetchAlbums() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));
    final List jsonList = jsonDecode(response.body);
    return jsonList.map((e) => Album.fromJson(e)).toList();
  }
}
