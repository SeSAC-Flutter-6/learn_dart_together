import 'package:learn_dart_together/19_network/practice_6/data_source/movie_data_source.dart';
import 'package:learn_dart_together/19_network/practice_6/mapper/movie_mapper.dart';
import 'package:learn_dart_together/19_network/practice_6/mapper/movie_detail_mapper.dart';
import 'package:learn_dart_together/19_network/practice_6/model/movie.dart';
import 'package:learn_dart_together/19_network/practice_6/model/movie_detail.dart';
import 'package:learn_dart_together/19_network/practice_6/repository/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieDataSource _movieDataSource;

  MovieRepositoryImpl(this._movieDataSource);

  @override
  Future<MovieDetail> getMovieDetail(int id) async {
    return (await _movieDataSource.getMovieDetail(id)).toMovieDetail();
  }

  @override
  Future<List<Movie>> getMovieInfoList() async {
    return (await _movieDataSource.getMovieInfoList())
        .map((e) => e.toMovie())
        .toList();
  }
}
