import 'dart:convert';
import 'dart:io';
import 'package:learn_dart_together/13_async/movie.dart';

Future<void> main() async {
  changeSB('lib/13_async/sample.csv', 'lib/13_async/modified.csv');

  print((await getMovieInfo()).director);

  // 연습문제 3.
  final result = await timeoutFuture()
      .timeout(Duration(seconds: 5), onTimeout: () => 'timeout!');
  print(result);
}

// 연습문제 1.
Future<void> changeSB(String source, String target) async {
  try {
    final content = await File(source).readAsString();
    final modified = content.replaceAll('한석봉', '김석봉');
    File(target).writeAsString(modified);
  } catch (e) {
    print('파일을 찾을 수 없습니다!');
  }
}

// 연습문제 2.
Future<Movie> getMovieInfo() async {
  await Future.delayed(Duration(seconds: 2));
  final String jsonString = '''{
    "title": "Star Ward",
    "director": "George Lucas",
    "year": 1977
  }''';

  final decodedData = Movie.fromJson(jsonDecode(jsonString));
  return decodedData;
}

Future<String> timeoutFuture() async {
  await Future.delayed(Duration(seconds: 6));
  return 'ok';
}
