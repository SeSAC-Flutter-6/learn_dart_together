import 'package:learn_dart_together/16_network/data_source/movie/movie_api.dart';
import 'package:learn_dart_together/16_network/dto/movie_detail_dto/movie_detail_dto.dart';
import 'package:learn_dart_together/16_network/dto/movie_dto.dart';
import 'package:learn_dart_together/16_network/mapper/movie_detail_mapper.dart';
import 'package:learn_dart_together/16_network/mapper/movie_mapper.dart';
import 'package:learn_dart_together/16_network/model/movie.dart';
import 'package:learn_dart_together/16_network/repository/movie/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieApi _movieApi;

  const MovieRepositoryImpl({
    required MovieApi movieApi,
  }) : _movieApi = movieApi;

  @override
  Future<Movie?> getMovieDetail(int id) async {
    try {
      MovieDetailDto? movieDto = await _movieApi.getMovieDetail(movieId: id);
      if (movieDto != null) {
        return movieDto.toMovieDetail();
      }
      return null;
    } catch (error) {
      print('Error getMovieDetail: $error');
      return null;
    }
  }

  @override
  Future<List<Movie>> getMovieInfoList({int? page}) async {
    try {
      List<MovieDto> movierDtos = await _movieApi.getMoives(page: page);
      List<Movie> moives =
          movierDtos.map((movierDto) => movierDto.toMovie()).toList();
      return moives;
    } catch (error) {
      print('Error getting movies: $error');
      return [];
    }
  }
}
