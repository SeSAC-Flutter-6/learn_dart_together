// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'movie.dart';

Future<Movie> getMovieInfo() async {
  await Future.delayed(Duration(seconds: 2));

  final String jsonString = '''
  {
    "title": "Star Wars",
    "director": "George Lucas",
    "year": 1977
  }
  ''';

  return Movie.fromJson(await jsonDecode(jsonString));
}
