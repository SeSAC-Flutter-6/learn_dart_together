import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/photo.dart';

class PhotoDataSource {
  Future<List<Photo>> fetchPhotos() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    final List jsonList = jsonDecode(response.body);
    return jsonList.map((e) => Photo.fromJson(e)).toList();
  }
}
