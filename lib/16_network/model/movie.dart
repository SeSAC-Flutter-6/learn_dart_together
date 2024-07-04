class Movie {
  final int id;
  final bool adult;
  final String title;
  final DateTime releasedDate;
  final double popularity;
  final List<String>? genres;
  final String? overview;
  final List<String>? productionCompanies;
  final String? originalTitie;
  final int? runtime;
  Movie({
    required this.id,
    required this.adult,
    required this.title,
    required this.releasedDate,
    required this.popularity,
    this.genres,
    this.overview,
    this.productionCompanies,
    this.originalTitie,
    this.runtime,
  });

  Movie copyWith({
    int? id,
    bool? adult,
    String? title,
    DateTime? releasedDate,
    double? popularity,
    List<String>? genres,
    String? overview,
    List<String>? productionCompanies,
    String? originalTitie,
    int? runtime,
  }) {
    return Movie(
      id: id ?? this.id,
      adult: adult ?? this.adult,
      title: title ?? this.title,
      releasedDate: releasedDate ?? this.releasedDate,
      popularity: popularity ?? this.popularity,
      genres: genres ?? this.genres,
      overview: overview ?? this.overview,
      productionCompanies: productionCompanies ?? this.productionCompanies,
      originalTitie: originalTitie ?? this.originalTitie,
      runtime: runtime ?? this.runtime,
    );
  }

  @override
  String toString() {
    return 'Movie(id: $id, adult: $adult, title: $title, releasedDate: $releasedDate, popularity: $popularity, genres: $genres, overview: $overview, productionCompanies: $productionCompanies, originalTitie: $originalTitie, runTime: $runtime)';
  }

  @override
  bool operator ==(covariant Movie other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.releasedDate == releasedDate;
  }

  @override
  int get hashCode {
    return id.hashCode ^ title.hashCode ^ releasedDate.hashCode;
  }
}
