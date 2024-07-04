import 'package:learn_dart_together/16_network/model/movie.dart';

abstract interface class MovieRepository {
  Future<List<Movie>> getMovieInfoList({int? page});
  Future<Movie?> getMovieDetail(int id);
}
