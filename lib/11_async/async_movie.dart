import 'dart:convert';

class Movie {
  String title;
  String director;
  int year;

  Movie({required this.title, required this.director, required this.year});

  Movie.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        director = json['director'],
        year = json['year'];

  Map<String, dynamic> toJson() => {
        'title': title,
        'director': director,
        'year': year,
      };

  @override
  String toString() {
    return 'Movie{title: $title, director: $director, year: $year}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Movie &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          director == other.director &&
          year == other.year;

  @override
  int get hashCode => title.hashCode ^ director.hashCode ^ year.hashCode;

  Movie copyWrite(String? title, String? director, int? year) => Movie(
        title: title ?? this.title,
        director: director ?? this.director,
        year: year ?? this.year,
      );
}

Future<Movie> getMovieInfo() async {
  await Future.delayed(Duration(seconds: 2));

  final String jsonString =
      '{"title" : "Star word","director" : "Georage Lucas", "year" : 1997}';

  return Movie.fromJson(jsonDecode(jsonString));
}

void main() async {
  final Movie movie = await getMovieInfo();
  print(movie.director);
}