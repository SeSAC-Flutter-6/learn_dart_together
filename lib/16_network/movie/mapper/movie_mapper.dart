import 'package:learn_dart_together/16_network/movie/model/movie.dart';

import '../dto/movie_dto.dart';

extension MovieMapper on MovieDto {
  Movie toMovie() {
    return Movie(
      id: id?.toInt() ?? 0,
      adult: adult ?? true,
      backdropPath: backdropPath ?? '',
      genreIds: genreIds?.map((e) => e.toInt()).toList() ?? [],
      originalLanguage: originalLanguage ?? '',
      originalTitle: originalTitle ?? '',
      overview: overview ?? '',
      popularity: popularity?.toInt() ?? 0,
      posterPath: posterPath ?? '',
      releaseDate: releaseDate ?? '',
      title: title ?? '',
      video: video ?? false,
      voteAverage: voteAverage?.toDouble() ?? 0.0,
      voteCount: voteCount?.toDouble() ?? 0.0,
    );
  }
}
