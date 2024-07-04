import 'package:learn_dart_together/17_result_pattern/core/result.dart';
import 'package:learn_dart_together/17_result_pattern/data/model/photo.dart';

abstract interface class PhotoRepository {
  Future<Result<List<Photo>>> getPhotos(
      {required String firstKeyword, String? secondKeyword});
}
