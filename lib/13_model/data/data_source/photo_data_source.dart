import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:learn_dart_together/13_model/data/model/photo.dart';

class PhotoDataSource {
  static final _baseUrl = 'https://jsonplaceholder.typicode.com/photos';

  Future<List<Photo>> getPhotos(int albumId) async {
    final http.Response response = await http.get(Uri.parse(_baseUrl));
    final List jsonList = jsonDecode(response.body);

    return jsonList.map((photo) => Photo.fromJson(photo)).toList();
  }
}
