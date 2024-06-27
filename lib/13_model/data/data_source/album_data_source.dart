import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:learn_dart_together/13_model/data/model/album.dart';

class AlbumDataSource {
  static final _baseUrl = 'https://jsonplaceholder.typicode.com/albums';

  Future<List<Album>> getAlbums() async {
    final http.Response response = await http.get(Uri.parse(_baseUrl));
    final List jsonList = jsonDecode(response.body);

    return jsonList.map((album) => Album.fromJson(album)).toList();
  }
}
