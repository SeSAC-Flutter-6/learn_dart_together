import 'package:learn_dart_together/19_network/practice_6/data_source/movie_api.dart';
import 'package:learn_dart_together/19_network/practice_6/repository/movie_repository_impl.dart';

void main() async {
  MovieRepositoryImpl movieRepositoryImpl = MovieRepositoryImpl(MovieApi());
  final movies = await movieRepositoryImpl.getMovieInfoList();
  movies.forEach(print);

  print('');

  final movieDetail = await movieRepositoryImpl.getMovieDetail(882059);
  print(movieDetail);
}
