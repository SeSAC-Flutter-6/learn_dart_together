import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:learn_dart_together/21_network/dto/movie_result_dto.dart';

class MovieDataSource {
  Future<MovieResultDto?> getMovieResult() async {
    return null;
  }

  Future<List<MovieDto>> getMovieInfoList() async {
    final response = await http.get(Uri.parse(''));

    try {
      switch (response.statusCode) {
        case >= 200 && < 300:
        // 200대 상태 코드 처리
          return (jsonDecode(response.body)['results'] as List)
              .map((e) => MovieDto.fromJson(e))
              .toList();
        case >= 300 && < 400:
        // 300대 상태 코드 처리
        case >= 400 && < 500:
        // 400대 상태 코드 처리
          throw Exception('내 탓');
        case >= 500:
          throw Exception('남 탓');
      }
    } catch (e) {
      throw Exception('몰라');
    }
    return [];
  }
}