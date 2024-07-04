import 'package:learn_dart_together/19_network/practice_6/model/movie.dart';
import 'package:learn_dart_together/19_network/practice_6/model/movie_detail.dart';

abstract interface class MovieRepository {
  Future<MovieDetail> getMovieDetail(int id);
  Future<List<Movie>> getMovieInfoList();
}
