import 'package:learn_dart_together/20_result/core/result.dart';
import 'package:learn_dart_together/20_result/practice2/model/photo.dart';

abstract interface class PhotoRepository {
  Future<Result<List<Photo>, String>> getPhotos(String query);
}
