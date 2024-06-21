//다음과 같은 json을 반환하는 함수가 있다(async, await 사용할것)

import 'dart:convert';
import 'dart:core';

class Movie {
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

  Map<String, dynamic> toJson() => {
        'title': title,
        'director': director,
        'year': year,
      };

//TODO: MOVIE 데이터 클래스를 리턴하도록 작성
}

final String jsonString = '''{
"title" : "Star Wars",
"director" : "George Lucas",
"year" : 1977
}''';

Future<void> main() async {
  Future<Movie> getMovieInfo() async {
    //여긴 왜 Future가 Type으로 해야 return Moive가 에러가 안나지?
    //Todo: 2초동안 기다리는 코드 작성
    await Future.delayed(Duration(seconds: 2));
    //String 형태의 JSON을 MAP으로 변환
    Map<String, dynamic> json = jsonDecode(jsonString);
    Movie movie = Movie.fromJson(json);
    print(movie);

    // 서버에서 들어오는 데이터라고 상상 - 이말은 Map 형태로 json을 받는거고,
    // toJson 이 필요하다는건가?

    return movie;
  }

  final movieName = await getMovieInfo();
  print(movieName.director);
}
