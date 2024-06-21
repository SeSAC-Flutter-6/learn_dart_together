class Movie {
  final String title;
  final String director;
  final int year;

  Movie(
    this.title,
    this.director,
    this.year,
  );

  Movie.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        director = json['director'],
        year = json['year'];

  Map<String, dynamic> toJson() => {
        'title': title,
        'director': director,
        'year': year,
      };

  Movie copyWith({
    String? title,
    String? director,
    int? year,
  }) {
    return Movie(
      title ?? this.title,
      director ?? this.director,
      year ?? this.year,
    );
  }

  @override
  String toString() => 'Movie(title: $title, director: $director, year: $year)';

  @override
  bool operator ==(covariant Movie other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.director == director &&
        other.year == year;
  }

  @override
  int get hashCode => title.hashCode ^ director.hashCode ^ year.hashCode;
}
