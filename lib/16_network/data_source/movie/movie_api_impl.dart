import 'dart:convert';
import 'package:learn_dart_together/16_network/data_source/movie/movie_api.dart';
import 'package:learn_dart_together/16_network/dto/movie_detail_dto/movie_detail_dto.dart';
import 'package:learn_dart_together/16_network/dto/movie_dto.dart';
import 'package:http/http.dart' as http;

class MovieApiImpl implements MovieApi {
  final String _baseUrl = 'https://api.themoviedb.org/3/movie';
  final String _apiKey = 'a64533e7ece6c72731da47c9c8bc691f';

  @override
  Future<List<MovieDto>> getMoives({int? page}) async {
    page ??= 1;
    try {
      final response = await http.get(Uri.parse(
          '$_baseUrl/upcoming?api_key=$_apiKey&language=ko-KR&page=${page.toString()}'));
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(utf8.decode(response.bodyBytes));
        final List resultsData = jsonData['results'];

        return resultsData
            .map((e) => MovieDto.fromJson(e as Map<String, dynamic>))
            .toList();
      } else {
        print('Failed to load: ${response.statusCode}');
        return [];
      }
    } catch (error) {
      print('Error fetching: $error');
      return [];
    }
  }

  @override
  Future<MovieDetailDto?> getMovie({required int movieId}) async {
    try {
      final response = await http.get(Uri.parse(
          '$_baseUrl/${movieId.toString()}?api_key=$_apiKey&language=ko-KR'));
      if (response.statusCode == 200) {
        final jsonData = jsonDecode(utf8.decode(response.bodyBytes));

        return MovieDetailDto.fromJson(jsonData);
      } else {
        throw Exception('Failed to load: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Error fetching: $error');
    }
  }
}
