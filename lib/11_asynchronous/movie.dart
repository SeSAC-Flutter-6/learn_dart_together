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
}
