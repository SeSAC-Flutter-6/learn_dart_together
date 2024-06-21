class Movie {
  String title;
  String director;
  int releaseYear;

  Movie({
    required this.title,
    required this.director,
    required this.releaseYear,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['title'],
      director: json['director'],
      releaseYear: json['year'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'director': director,
      'year': releaseYear,
    };
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Movie &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          director == other.director &&
          releaseYear == other.releaseYear;

  @override
  int get hashCode => Object.hash(title, director, releaseYear);

  @override
  String toString() {
    return 'Movie{title: $title, director: $director, year: $releaseYear}';
  }

  Movie copyWith({
    String? title,
    String? director,
    int? releaseYear,
  }) {
    return Movie(
      title: title ?? this.title,
      director: director ?? this.director,
      releaseYear: releaseYear ?? this.releaseYear,
    );
  }
}
