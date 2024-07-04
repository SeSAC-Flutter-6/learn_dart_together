import 'dart:convert';

import 'package:learn_dart_together/23_result_pattern/pixabay/data_source/photo_data_source.dart';
import 'package:learn_dart_together/23_result_pattern/pixabay/dto/photo_dto.dart';
import 'package:http/http.dart' as http;

class PhotoDataSourceImpl implements PhotoDataSource {
  @override
  Future<List<Hits>> getPhotoDto(String query) async {
    final response = await http.get(Uri.parse(
        'https://pixabay.com/api/?key=41482986-9b8db281c117219c7503a3520&q=$query&image_type=photo&pretty=true'));
    final data = jsonDecode(response.body)['hits'] as List;
    return data.map((e) => Hits.fromJson(e)).toList();
  }
}
