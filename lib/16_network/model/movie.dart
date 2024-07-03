class Movie {
  int id;
  bool adult;
  String title;
  DateTime releasedDate;
  int popularity;
  Movie({
    required this.id,
    required this.adult,
    required this.title,
    required this.releasedDate,
    required this.popularity,
  });

  Movie copyWith({
    int? id,
    bool? adult,
    String? title,
    DateTime? releasedDate,
    int? popularity,
  }) {
    return Movie(
      id: id ?? this.id,
      adult: adult ?? this.adult,
      title: title ?? this.title,
      releasedDate: releasedDate ?? this.releasedDate,
      popularity: popularity ?? this.popularity,
    );
  }

  @override
  String toString() {
    return 'Movie(id: $id, adult: $adult, title: $title, releasedDate: $releasedDate, popularity: $popularity)';
  }

  @override
  bool operator ==(covariant Movie other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.adult == adult &&
        other.title == title &&
        other.releasedDate == releasedDate &&
        other.popularity == popularity;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        adult.hashCode ^
        title.hashCode ^
        releasedDate.hashCode ^
        popularity.hashCode;
  }
}
