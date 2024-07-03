import 'package:learn_dart_together/19_network/practice_6/dto/movie_detail_dto.dart';
import 'package:learn_dart_together/19_network/practice_6/dto/movie_dto.dart';

abstract interface class MovieDataSource {
  // Future<Results> getMovieInfo(Movie movie);
  Future<MovieDetailDto> getMovieDetail(int id);
  Future<List<Results>> getMovieInfoList();
  // Future<Results> createMovieInfo(Movie movie);
  // Future<Results> deleteMovieInfo(Movie movie);
  // Future<Results> updateMovieInfo(Movie movie);
}
