import 'package:learn_dart_together/homework/photo/data/model/photo.dart';

import '../../../core/result.dart';

abstract interface class PhotoRepository {
  Future<Result<List<Photo>>> getPhotos(String query);
}