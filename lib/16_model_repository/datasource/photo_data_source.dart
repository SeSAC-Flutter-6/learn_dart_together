import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:learn_dart_together/16_model_repository/model/photo.dart';

class PhotoDataSource {
  static final _baseUrl = 'https://jsonplaceholder.typicode.com/photos';

  Future<List<Photo>> getPhotos(int albumId) async {
    final http.Response response = await http.get(Uri.parse(_baseUrl));
    List jsonList = jsonDecode(response.body);
    return jsonList.map((e) => Photo.fromJson(e)).toList();
  }
}
