import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:learn_dart_together/17_result/image_search/dto/photo_result_dto.dart';

class ImageSearchApi {
  static final _baseUrl = 'https://pixabay.com/api/';
  static final _apiKey = '23250794-10cf3e5d8b5552960f16090c5';

  Future<List<PhotoDto>> getPhotos(String query) async {
    final url = '$_baseUrl?key=$_apiKey&q=$query&image_type=photo';
    final http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode != 200) throw Exception('request fail');

    final jsonResult = jsonDecode(response.body);

    return PhotoResultDto.fromJson(jsonResult).hits ?? [];
  }
}
