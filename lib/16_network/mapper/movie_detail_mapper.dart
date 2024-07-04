import 'package:learn_dart_together/16_network/dto/movie_detail_dto/movie_detail_dto.dart';
import 'package:learn_dart_together/16_network/model/movie.dart';
import 'package:learn_dart_together/utils/date_time_util.dart';

extension MovieDetailMapper on MovieDetailDto {
  Movie toMovieDetail() {
    return Movie(
        id: id ?? -1,
        adult: adult ?? false,
        title: title ?? '',
        releasedDate: DateTimeUtil.parseDateTime(releaseDate),
        popularity: popularity ?? -1.0,
        genres: genres?.map((genre) => genre.name ?? '').toList() ?? [],
        overview: overview ?? '',
        productionCompanies: productionCompanies
                ?.map((company) => company.name ?? '')
                .toList() ??
            [],
        originalTitie: originalTitle ?? '',
        runtime: runtime ?? -1);
  }
}
