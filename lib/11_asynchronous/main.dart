import 'package:learn_dart_together/11_asynchronous/csv_convert.dart';
import 'package:learn_dart_together/11_asynchronous/movie.dart';
import 'package:learn_dart_together/11_asynchronous/service/movie_service_fake.dart';
import 'package:learn_dart_together/11_asynchronous/timeout.dart';

Future<void> main() async {
  final MovieServiceFake movieService = MovieServiceFake();
  final Movie movie = await movieService.getMovieInfo();
  print(movie.director);
  print(movie.title);
  print(movie.releaseYear);

  await processCsvFile(
    sourceFilePath: 'lib/11_asynchronous/data/sample.csv',
    convertFilePath: 'lib/11_asynchronous/data/sample_copy.csv',
  );

  String result =
      await timeoutFuture().timeout(Duration(seconds: 5), onTimeout: () {
    return 'timeout';
  });
  print(result);
}
