import 'dart:async';
import 'dart:convert';

Future<void> main() async {
  Future<Movie> getMovieInfo() async {
    await Future.delayed(Duration(seconds: 2));

    final String jsonString =
        '''{"title": "Star Ward", "director": "George Lucas", "year": 1977}''';

    Movie movieData = Movie.fromJson(jsonDecode(jsonString));
    return movieData;
  }

  Movie movie = await getMovieInfo();
  print(movie.director);
}

class Movie {
  String title;
  String director;
  int year;

  Movie.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        director = json['director'],
        year = json['year'];

  @override
  String toString() {
    return 'Movie{title: $title, director: $director, year: $year}';
  }
}
