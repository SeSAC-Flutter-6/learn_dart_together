import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:learn_dart_together/12_data_source/model/album.dart';

final class AlbumDataSource {
  Future<List<Album>> getAlbums() async {
    final http.Response response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));
    List jsonList = jsonDecode(response.body);
    return jsonList.map((e) => Album.fromJson(e)).toList();
  }

  Future<List<Album>> getAlbumsTop10() async {
    final http.Response response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));
    List jsonList = jsonDecode(response.body);
    return jsonList.map((e) => Album.fromJson(e)).toList().sublist(0, 9);
  }
}