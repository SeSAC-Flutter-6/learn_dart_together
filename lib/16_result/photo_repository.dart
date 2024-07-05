import 'package:learn_dart_together/16_result/photo.dart';
import 'package:learn_dart_together/16_result/result.dart';

abstract interface class PhotoRepository {
  Future<Result<List<Photo>, PhotoRepositoryError>> getPhotos(String query);
}

enum PhotoRepositoryError {
  profanityDetected,
  networkTimeout,
  unknown
}