import 'dart:convert';

import 'package:http/http.dart' as http;
import '../model/album.dart';

class AlbumDataSource {
  static final _baseUrl = 'https://jsonplaceholder.typicode.com/albums';

  Future<List<Album>> getAlbums() async {
    final http.Response response = await http.get(Uri.parse(_baseUrl));
    List jsonList = jsonDecode(response.body);
    return jsonList.map((e) => Album.fromJson(e)).toList();
  }
}
