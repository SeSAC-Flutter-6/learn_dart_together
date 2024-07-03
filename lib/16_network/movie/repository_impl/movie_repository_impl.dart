import 'package:learn_dart_together/16_network/movie/data_source/movie_api.dart';
import 'package:learn_dart_together/16_network/movie/mapper/movie_detail_mapper.dart';
import 'package:learn_dart_together/16_network/movie/mapper/movie_mapper.dart';
import 'package:learn_dart_together/16_network/movie/model/movie_detail.dart';
import 'package:learn_dart_together/16_network/movie/repository/movie_repository.dart';

import '../model/movie.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieApi _movieApi;

  MovieRepositoryImpl(this._movieApi);

  @override
  Future<List<Movie>> getMovieInfoList() async {
    final movieDto = await _movieApi.getMovieInfoList();

    return movieDto.map((dto) => dto.toMovie()).toList();
  }

  @override
  Future<MovieDetail> getMovieDetail(int id) async {
    final movieDetailDto = await _movieApi.getMovieDetail(id);

    return movieDetailDto.toMovieDetail();
  }
}
