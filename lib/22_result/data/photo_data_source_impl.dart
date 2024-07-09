import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:learn_dart_together/22_result/data/photo_data_source.dart';
import 'package:learn_dart_together/22_result/dto/photo_dto.dart';
import 'package:learn_dart_together/22_result/core/result.dart';


class PhotoDataSourceImpl implements PhotoDataSource {
  static const String _baseUrl = 'https://pixabay.com/api';

  @override
  Future<List<Hits>> getPhotoData(String query) async {
    final String? apiKey = dotenv.env['API_KEY'];
    final url = '$_baseUrl/?key=$apiKey&q=$query&image_type=photo&pretty=true';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)['hits'] as List;
      List<Hits> hitsList = data.map((e) => Hits.fromJson(e)).toList();
      return hitsList;
    } else {
      throw Exception('Failed to load photos');
    }
  }
}