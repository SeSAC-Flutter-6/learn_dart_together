import 'dart:convert';

Future<Movie> getMovieInfo() async {
  await Future.delayed(Duration(seconds: 2));
  final String jsonString = '''
   {
     "title": "Star Ward",
     "director": "George Lucas",
     "year": 1977
   }
 ''';
  // Map<String, dynamic> json = jsonDecode(jsonString);
  // Movie movie = Movie.fromJson(json);
  // return movie;
  return Movie.fromJson(jsonDecode(jsonString));
}

class Movie {
  String title = '';
  String director = '';
  int year = 0;

  Movie({
    required this.title,
    required this.director,
    required this.year,
  });

  Movie.fromJson(Map<String, dynamic> json)
      : title = json['title'] ?? '',
        director = json['director'] ?? '',
        year = json['year'] ?? 0;
}

void main() async {
  final Movie movie = await getMovieInfo();
  print(movie.director);
  print(movie.title);
  print(movie.year);
}
