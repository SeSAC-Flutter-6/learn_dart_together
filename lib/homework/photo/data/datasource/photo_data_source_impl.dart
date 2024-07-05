import 'dart:convert';

import 'package:learn_dart_together/homework/photo/data/datasource/photo_data_source.dart';
import 'package:learn_dart_together/homework/photo/data/dto/photo_dto.dart';
import 'package:http/http.dart' as http;

class PhotoDataSourceImpl implements PhotoDataSource {
  static const String _pixabayApiKey = '11245670-ca96b1d5b68fd166182c5d00a';
  static const String _pixabayBaseUrl = 'https://pixabay.com/api/';

  @override
  Future<List<PhotoResultDto>> getPhotos(String query) async {
    final String url =
        '$_pixabayBaseUrl?key=$_pixabayApiKey&q=$query&image_type=photo&pretty=true';

    final http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      return List.unmodifiable([PhotoResultDto.fromJson(jsonResponse)]);
    } else {
      throw Exception('');
    }
  }
}
