import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:learn_dart_together/22_result/data/photo_data_source.dart';
import 'package:learn_dart_together/22_result/dto/photo_dto.dart';
import 'package:learn_dart_together/22_result/core/result.dart';


class PhotoDataSourceImpl implements PhotoDataSource {
  static const String _baseUrl = 'https://pixabay.com/api';
  static const String _apiKey = '41482986-9b8db281c117219c7503a3520';

  @override
  Future<List<Hits>> getPhotoData(String query) async {
    final url = '$_baseUrl/?key=$_apiKey&q=$query&image_type=photo&pretty=true';
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