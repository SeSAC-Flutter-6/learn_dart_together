import 'package:learn_dart_together/16_network/dto/movie_detail_dto/movie_detail_dto.dart';
import 'package:learn_dart_together/16_network/dto/movie_dto.dart';

abstract interface class MovieApi {
  Future<List<MovieDto>> getMoives({int? page});
  Future<MovieDetailDto?> getMovie({required int movieId});
}
