import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:learn_dart_together/13_model/data/model/photo.dart';

class PhotoDataSource {
  final String baseUrl;

  PhotoDataSource(
      {this.baseUrl = 'https://jsonplaceholder.typicode.com/photos'});

  Future<List<Photo>> getPhotos() async {
    final http.Response response = await http.get(Uri.parse(baseUrl));
    final List jsonList = jsonDecode(response.body);

    return jsonList.map((photo) => Photo.fromJson(photo)).toList();
  }
}
