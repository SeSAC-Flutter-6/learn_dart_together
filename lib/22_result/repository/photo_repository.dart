import 'package:learn_dart_together/22_result/model/photo.dart';
import 'package:learn_dart_together/22_result/result.dart';

abstract interface class PhotoRepository {
  Future<Result<List<Photo>>> getPhotos(String query);
}


