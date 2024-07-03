import 'package:learn_dart_together/16_network/movie/dto/movie_detail_dto.dart';
import 'package:learn_dart_together/16_network/movie/model/movie_detail.dart';

extension MovieDetailMapper on MovieDetailDto {
  MovieDetail toMovieDetail() {
    return MovieDetail(
      adult: adult ?? false,
      id: id?.toInt() ?? 0,
      imdbId: imdbId ?? '',
      originCountry: originCountry ?? [],
      originalLanguage: originalLanguage ?? '',
      originalTitle: originalTitle ?? '',
      overview: overview ?? '',
      popularity: popularity?.toDouble() ?? 0.0,
      posterPath: posterPath ?? '',
      releaseDate: releaseDate ?? '',
      runtime: runtime?.toInt() ?? 0,
      status: status ?? '',
      tagline: tagline ?? '',
      title: title ?? '',
      video: video ?? false,
      voteAverage: voteAverage?.toDouble() ?? 0.0,
      voteCount: voteCount?.toInt() ?? 0,
    );
  }
}
