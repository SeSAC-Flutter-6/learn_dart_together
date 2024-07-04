import 'dart:convert';

import 'package:learn_dart_together/20_ressult/practice_2/data_source/photo_data_source.dart';
import 'package:learn_dart_together/20_ressult/practice_2/dto/photo_result_dto.dart';
import 'package:http/http.dart' as http;

class PhotoApi implements PhotoDataSource {
  final String _baseUrl;
  final String _apiKey = '44775432-05863e6aabdb24f52137cd6d1';

  PhotoApi({String url = 'https://pixabay.com/api/videos/'}) : _baseUrl = url;

  @override
  Future<List<PhotoDto>> getPhotos(String query) async {
    final response = await http
        .get(Uri.parse('$_baseUrl?key=$_apiKey&q=$query&pretty=true'));
    if (response.statusCode == 200) {
      final List<PhotoDto> photoList =
          (jsonDecode(response.body)['hits'] as List)
              .map((e) => PhotoDto.fromJson(e))
              .toList();
      return List.unmodifiable(photoList);
    } else {
      throw Exception('Failed to load photos');
    }
  }
}
