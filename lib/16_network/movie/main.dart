import 'package:learn_dart_together/16_network/movie/data_source/movie_api.dart';
import 'package:learn_dart_together/16_network/movie/repository_impl/movie_repository_impl.dart';

void main() async {
  final movieApi = MovieApi();
  final movieRepository = MovieRepositoryImpl(movieApi);
  final movieList = await movieRepository.getMovieInfoList();
  // print(movieList);

  final moveDetail = await movieRepository.getMovieDetail(519182);
  // print(moveDetail);
}
