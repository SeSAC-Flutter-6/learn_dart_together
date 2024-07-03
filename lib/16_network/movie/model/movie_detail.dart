class MovieDetail {
  bool adult;
  int id;
  String imdbId;
  List<String> originCountry;
  String originalLanguage;
  String originalTitle;
  String overview;
  double popularity;
  String posterPath;
  String releaseDate;
  int runtime;
  String status;
  String tagline;
  String title;
  bool video;
  double voteAverage;
  int voteCount;

//<editor-fold desc="Data Methods">
  MovieDetail({
    required this.adult,
    required this.id,
    required this.imdbId,
    required this.originCountry,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.runtime,
    required this.status,
    required this.tagline,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MovieDetail &&
          runtimeType == other.runtimeType &&
          adult == other.adult &&
          id == other.id &&
          imdbId == other.imdbId &&
          originCountry == other.originCountry &&
          originalLanguage == other.originalLanguage &&
          originalTitle == other.originalTitle &&
          overview == other.overview &&
          popularity == other.popularity &&
          posterPath == other.posterPath &&
          releaseDate == other.releaseDate &&
          runtime == other.runtime &&
          status == other.status &&
          tagline == other.tagline &&
          title == other.title &&
          video == other.video &&
          voteAverage == other.voteAverage &&
          voteCount == other.voteCount);

  @override
  int get hashCode =>
      adult.hashCode ^
      id.hashCode ^
      imdbId.hashCode ^
      originCountry.hashCode ^
      originalLanguage.hashCode ^
      originalTitle.hashCode ^
      overview.hashCode ^
      popularity.hashCode ^
      posterPath.hashCode ^
      releaseDate.hashCode ^
      runtime.hashCode ^
      status.hashCode ^
      tagline.hashCode ^
      title.hashCode ^
      video.hashCode ^
      voteAverage.hashCode ^
      voteCount.hashCode;

  @override
  String toString() {
    return 'MovieDetail{ adult: $adult, id: $id, imdbId: $imdbId, originCountry: $originCountry, originalLanguage: $originalLanguage, originalTitle: $originalTitle, overview: $overview, popularity: $popularity, posterPath: $posterPath, releaseDate: $releaseDate, runtime: $runtime, status: $status, tagline: $tagline, title: $title, video: $video, voteAverage: $voteAverage, voteCount: $voteCount,}';
  }

  MovieDetail copyWith({
    bool? adult,
    int? id,
    String? imdbId,
    List<String>? originCountry,
    String? originalLanguage,
    String? originalTitle,
    String? overview,
    double? popularity,
    String? posterPath,
    String? releaseDate,
    int? runtime,
    String? status,
    String? tagline,
    String? title,
    bool? video,
    double? voteAverage,
    int? voteCount,
  }) {
    return MovieDetail(
      adult: adult ?? this.adult,
      id: id ?? this.id,
      imdbId: imdbId ?? this.imdbId,
      originCountry: originCountry ?? this.originCountry,
      originalLanguage: originalLanguage ?? this.originalLanguage,
      originalTitle: originalTitle ?? this.originalTitle,
      overview: overview ?? this.overview,
      popularity: popularity ?? this.popularity,
      posterPath: posterPath ?? this.posterPath,
      releaseDate: releaseDate ?? this.releaseDate,
      runtime: runtime ?? this.runtime,
      status: status ?? this.status,
      tagline: tagline ?? this.tagline,
      title: title ?? this.title,
      video: video ?? this.video,
      voteAverage: voteAverage ?? this.voteAverage,
      voteCount: voteCount ?? this.voteCount,
    );
  }
//</editor-fold>
}