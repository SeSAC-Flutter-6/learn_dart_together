import 'dart:convert';

import 'package:learn_dart_together/16_network/movie/dto/movie_data_dto.dart';
import 'package:http/http.dart' as http;
import 'package:learn_dart_together/16_network/movie/dto/movie_detail_dto.dart';

import '../dto/movie_dto.dart';

class MovieApi {
  static final _apikey = 'a64533e7ece6c72731da47c9c8bc691f';
  static final _baseUrl = 'https://api.themoviedb.org/3/movie/';
  final _upcoming = 'upcoming';

  Future<List<MovieDto>> getMovieInfoList() async {
    final http.Response response = await http.get(
        Uri.parse('$_baseUrl$_upcoming?api_key=$_apikey&language=ko-KR&page=1'));

    if (response.statusCode != 200) throw Exception('request fail');

    final json = jsonDecode(response.body);

    return MovieDataDto.fromJson(json).results ?? [];
  }

  Future<MovieDetailDto> getMovieDetail(int id) async {
    final http.Response response = await http.get(Uri.parse(
        '$_baseUrl${id.toString()}?api_key=$_apikey&language=ko-KR&page=1'));

    if (response.statusCode != 200) throw Exception('request fail');

    final json = jsonDecode(response.body);

    return MovieDetailDto.fromJson(json);
  }
}
