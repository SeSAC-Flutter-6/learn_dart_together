class Movie {
  final bool adult;
  final int id;
  final String originalLanguage;
  final String overview;
  final double popularity;
  final String releaseDate;
  final String title;
  final double voteAverage;
  final int voteCount;

  Movie({
    required this.adult,
    required this.id,
    required this.originalLanguage,
    required this.overview,
    required this.popularity,
    required this.releaseDate,
    required this.title,
    required this.voteAverage,
    required this.voteCount,
  });

  Movie copyWith({
    bool? adult,
    int? id,
    String? originalLanguage,
    String? overview,
    double? popularity,
    String? releaseDate,
    String? title,
    double? voteAverage,
    int? voteCount,
  }) {
    return Movie(
      adult: adult ?? this.adult,
      id: id ?? this.id,
      originalLanguage: originalLanguage ?? this.originalLanguage,
      overview: overview ?? this.overview,
      popularity: popularity ?? this.popularity,
      releaseDate: releaseDate ?? this.releaseDate,
      title: title ?? this.title,
      voteAverage: voteAverage ?? this.voteAverage,
      voteCount: voteCount ?? this.voteCount,
    );
  }

  @override
  String toString() {
    return 'Movie(adult: $adult, id: $id, originalLanguage: $originalLanguage, overview: $overview, popularity: $popularity, releaseDate: $releaseDate, title: $title, voteAverage: $voteAverage, voteCount: $voteCount)';
  }

  @override
  bool operator ==(covariant Movie other) {
    if (identical(this, other)) return true;

    return other.adult == adult &&
        other.id == id &&
        other.originalLanguage == originalLanguage &&
        other.overview == overview &&
        other.popularity == popularity &&
        other.releaseDate == releaseDate &&
        other.title == title &&
        other.voteAverage == voteAverage &&
        other.voteCount == voteCount;
  }

  @override
  int get hashCode {
    return adult.hashCode ^
        id.hashCode ^
        originalLanguage.hashCode ^
        overview.hashCode ^
        popularity.hashCode ^
        releaseDate.hashCode ^
        title.hashCode ^
        voteAverage.hashCode ^
        voteCount.hashCode;
  }
}
