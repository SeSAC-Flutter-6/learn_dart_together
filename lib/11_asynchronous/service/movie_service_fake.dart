import 'dart:convert';
import 'package:learn_dart_together/11_asynchronous/movie.dart';
import 'package:learn_dart_together/11_asynchronous/data/fake_movie_data.dart';
import 'package:learn_dart_together/11_asynchronous/service/movie_service.dart';

class MovieServiceFake implements MovieService {
  @override
  Future<Movie> getMovieInfo() async {
    await Future.delayed(Duration(seconds: 2));
    final Movie movie = Movie.fromJson(jsonDecode(fakeMoiveDataJsonStr));
    return movie;
  }
}
