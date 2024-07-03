import 'package:learn_dart_together/19_network/practice_6/dto/movie_detail_dto.dart';
import 'package:learn_dart_together/19_network/practice_6/model/movie_detail.dart';

extension MovieDetailMapper on MovieDetailDto {
  MovieDetail toMovieDetail() {
    return MovieDetail(
      id: id!,
      title: title!,
      overview: overview!,
      genres: genres!.map((e) => Genre(id: e.id!, name: e.name!)).toList(),
      releaseDate: releaseDate!,
      posterPath: posterPath!,
    );
  }
}
