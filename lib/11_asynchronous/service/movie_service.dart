import 'package:learn_dart_together/11_asynchronous/movie.dart';

abstract class MovieService{
  Future<Movie> getMovieInfo();
}