import 'dart:convert';

import 'package:learn_dart_together/23_result_pattern/pixabay/data_source/photo_data_source.dart';
import 'package:learn_dart_together/23_result_pattern/pixabay/dto/photo_dto.dart';

class MockPhotoDataSource implements PhotoDataSource {
  final String mockData;

  const MockPhotoDataSource({
    required this.mockData,
  });

  @override
  Future<List<Hits>> getPhotoDto(String query) async {
    final response = jsonDecode(mockData) as List;
    return response.map((e) => Hits.fromJson(e)).toList();
  }
}
