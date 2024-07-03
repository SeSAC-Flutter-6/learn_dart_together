import 'package:collection/collection.dart';

class MovieDetail {
  final int id;
  final String title;
  final String overview;
  final List<Genre> genres;
  final String releaseDate;
  final String posterPath;

  MovieDetail({
    required this.id,
    required this.title,
    required this.overview,
    required this.genres,
    required this.releaseDate,
    required this.posterPath,
  });

  MovieDetail copyWith({
    int? id,
    String? title,
    String? overview,
    List<Genre>? genres,
    String? releaseDate,
    String? posterPath,
  }) {
    return MovieDetail(
      id: id ?? this.id,
      title: title ?? this.title,
      overview: overview ?? this.overview,
      genres: genres ?? this.genres,
      releaseDate: releaseDate ?? this.releaseDate,
      posterPath: posterPath ?? this.posterPath,
    );
  }

  @override
  String toString() {
    return 'MovieDetail(id: $id, title: $title, overview: $overview, genres: $genres, releaseDate: $releaseDate, posterPath: $posterPath)';
  }

  @override
  bool operator ==(covariant MovieDetail other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other.id == id &&
        other.title == title &&
        other.overview == overview &&
        listEquals(other.genres, genres) &&
        other.releaseDate == releaseDate &&
        other.posterPath == posterPath;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        overview.hashCode ^
        genres.hashCode ^
        releaseDate.hashCode ^
        posterPath.hashCode;
  }
}

class Genre {
  final int id;
  final String name;

  Genre({required this.id, required this.name});
}
