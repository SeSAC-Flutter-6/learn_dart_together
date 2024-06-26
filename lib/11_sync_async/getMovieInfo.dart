import 'dart:convert';

Future<void> main() async {
  Future<Movie> getMovieInfo() async {
    await Future.delayed(const Duration(seconds: 2));
    final String jsonString = '''{
      "title": "Star Ward",
      "director": "George Lucas",
      "year": 1977
      }''';
    final decodedString = jsonDecode(jsonString);

    return Movie.fromJson(decodedString);
  }


  final movie2 = getMovieInfo();
  movie2.then((value) {
    print(value);
  });

  print('안녕1');

  final movie = await getMovieInfo();
  print('안녕2');

  final movie3 = getMovieInfo();
  movie3.then((value) {
    print(value);
  });

  print(movie.director);
}

final class Movie {
  String title;
  String director;
  int year;

  Movie({
    required this.title,
    required this.director,
    required this.year,
  });

  Movie.fromJson(Map<String, dynamic> json)
    : title = json['title'],
      director = json['director'],
      year = json['year'];

  @override
  // TODO: implement hashCode
  int get hashCode => Object.hash(title, director, year);

  @override
  bool operator ==(Object other) =>
    identical(this, other) ||
    other is Movie &&
      runtimeType == other.runtimeType &&
      title == other.title &&
      director == other.director &&
      year == other.year;

  Map<String, dynamic> toJson() =>
      {'title': title, 'director': director, 'year': year};

  @override
  String toString() =>
      'Movie{title: $title, director: $director, year: $year}';
}