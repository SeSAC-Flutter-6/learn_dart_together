import 'package:test/test.dart';
import 'package:learn_dart_together/16_240620_async/movie.dart';
import 'package:learn_dart_together/16_240620_async/practice2.dart';

void main() {
  test('getMovieInfo', () async {
    Movie movie = await getMovieInfo();
    print(movie);
    expect(movie.title, equals("Star Wars"));
    expect(movie.director, equals('George Lucas'));
    expect(movie.year, equals(1977));
  });
}
