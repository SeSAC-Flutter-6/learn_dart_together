import 'package:learn_dart_together/19_network/practice_6/dto/movie_dto.dart';
import 'package:learn_dart_together/19_network/practice_6/model/movie.dart';

extension MovieMapper on Results {
  Movie toMovie() {
    return Movie(
        adult: adult!,
        id: id!,
        originalLanguage: originalLanguage!,
        overview: overview!,
        popularity: popularity!,
        releaseDate: releaseDate!,
        title: title!,
        voteAverage: voteAverage!,
        voteCount: voteCount!);
  }
}
