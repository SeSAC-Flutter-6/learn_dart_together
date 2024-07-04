import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:learn_dart_together/16_result/photo_data_source.dart';
import 'package:learn_dart_together/16_result/photo_dto.dart';

class DefaultPhotoDataSourceImpl implements PhotoDataSource {
  static final _baseURL =
      'https://pixabay.com/api/?key=44773551-011888a47e4f1bd36920cb05e';
  @override
  Future<List<PhotoDTO>> getPhotos(String query) async {
    try {
      final response = await http.get(Uri.parse('${_baseURL}&q=${query}'));
      if (response.statusCode == 200) {
        final jsonList = jsonDecode(response.body);
        return jsonList
            .map((e) => PhotoDTO.fromJson(e))
            .toList();
      } else {
        throw Exception('Failed to load photos: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Error fetching photos: $error');
    }
  }
}