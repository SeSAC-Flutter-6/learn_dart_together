import 'dart:convert';

void main() async {
  Movie movie = await getMovieInfo();
  print(movie.director);
}

Future<Movie> getMovieInfo() async {
  await Future.delayed(Duration(seconds: 2));

  final String jsonString = '''{
    "title": "Start Ward",
    "director": "Georage Lucas",
    "year": 1977
    }''';

  final Map<String, dynamic> jsonMap = jsonDecode(jsonString);
  return Movie.fromJson(jsonMap);
}

class Movie {
  final String title;
  final String director;
  final int year;

  Movie({
    required this.title,
    required this.director,
    required this.year,
  });

  Movie.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        director = json['director'],
        year = json['year'];
}
