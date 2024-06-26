import 'get_movie_info.dart';
import 'movie.dart';

Future<void> main() async {
  List<Future<Movie>> movies = [
    getMovieInfo(),
    getMovieInfo(),
    getMovieInfo(),
    getMovieInfo(),
    getMovieInfo(),
  ];

  List<Movie> movieList = await Future.wait(movies);
  movieList.map((e) => (e.title)).forEach(print);
}
