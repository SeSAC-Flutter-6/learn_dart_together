import 'dart:convert';
import 'package:learn_dart_together/16_240620_async/movie.dart';

Future<Movie> getMovieInfo() async {
  await Future.delayed(Duration(seconds: 2));

  final String jsonString = '''{
    "title": "Star Wars",
    "director": "George Lucas",
    "year": 1977
  }''';

  Map<String, dynamic> map = jsonDecode(jsonString);
  return Movie.from(map);
}
