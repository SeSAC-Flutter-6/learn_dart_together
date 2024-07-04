import 'package:learn_dart_together/16_network/data_source/movie/movie_api.dart';
import 'package:learn_dart_together/16_network/data_source/movie/movie_api_impl.dart';
import 'package:learn_dart_together/16_network/model/movie.dart';
import 'package:learn_dart_together/16_network/repository/movie/movie_repository.dart';
import 'package:learn_dart_together/16_network/repository/movie/movie_repository_impl.dart';

Future<void> main() async {
  MovieApi movieApi = MovieApiImpl();
  MovieRepository movieRepository = MovieRepositoryImpl(movieApi: movieApi);
  List<Movie> movieLists = await movieRepository.getMovieInfoList(page: 2);
  for (var movie in movieLists) {
    print(movie.toString());
  }
  Movie? insideOut2 = await movieRepository.getMovieDetail(1022789);
  print(insideOut2.toString());
}
