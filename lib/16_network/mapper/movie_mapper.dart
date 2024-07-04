import 'package:learn_dart_together/16_network/dto/movie_dto.dart';
import 'package:learn_dart_together/16_network/model/movie.dart';
import 'package:learn_dart_together/utils/date_time_util.dart';

extension MovieMapper on MovieDto {
  Movie toMovie() {
    return Movie(
      id: id ?? -1,
      adult: adult ?? false,
      title: title ?? '',
      releasedDate: DateTimeUtil.parseDateTime(releaseDate),
      popularity: popularity ?? -1.0,
    );
  }
}
