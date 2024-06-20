import 'dart:convert';
import 'dart:io';

import 'package:learn_dart_together/11_asynchronous/movie.dart';
import 'package:learn_dart_together/11_asynchronous/service/movie_service.dart';

class MovieServiceImpl extends MovieService {
  @override
  Future<Movie> getMovieInfo() async {
    await Future.delayed(Duration(seconds: 2));

    HttpClient client = HttpClient();
    HttpClientRequest request = await client.getUrl(Uri.parse('https://서버주소'));
    HttpClientResponse response = await request.close();
    if (response.statusCode != 200) {
      throw Exception();
    }
    String responseBody = await response.transform(utf8.decoder).join();
    Movie movie = Movie.fromJson(jsonDecode(responseBody));
    return movie;
  }
}
