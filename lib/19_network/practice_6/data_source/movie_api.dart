import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:learn_dart_together/19_network/practice_6/data_source/movie_data_source.dart';
import 'package:learn_dart_together/19_network/practice_6/dto/movie_detail_dto.dart';
import 'package:learn_dart_together/19_network/practice_6/dto/movie_dto.dart';

class MovieApi implements MovieDataSource {
  final String _baseUrl;
  final String _apiKey = 'a64533e7ece6c72731da47c9c8bc691f';
  MovieApi({String url = 'https://api.themoviedb.org/3/movie'})
      : _baseUrl = url;

  @override
  Future<MovieDetailDto> getMovieDetail(int id) async {
    final response = await http
        .get(Uri.parse('$_baseUrl/$id?api_key=$_apiKey&language=ko-KR&page=1'));
    return MovieDetailDto.fromJson(jsonDecode(response.body));
  }

  @override
  Future<List<Results>> getMovieInfoList() async {
    final response = await http.get(
        Uri.parse('$_baseUrl/upcoming?api_key=$_apiKey&language=ko-KR&page=1'));
    return (jsonDecode(response.body)['results'] as List)
        .map((itemJson) => Results.fromJson(itemJson))
        .toList();
  }
}
