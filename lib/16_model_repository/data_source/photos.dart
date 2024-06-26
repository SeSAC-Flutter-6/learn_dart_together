import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/photo.dart';

class PhotoDataSource {
  Future<List<Photo>> getPhotoList() async {
    final responsePhoto = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    final List<Photo> commentList = jsonDecode(responsePhoto.body)
            .map<Photo>(
                (json) => Photo.fromJson((json as Map<String, dynamic>)))
            .toList() ??
        [];
    return commentList;
  }
}
