import 'package:learn_dart_together/23_result_pattern/pixabay/core/result.dart';

import '../model/photo.dart';

abstract interface class PhotoRepository {
  Future<Result<List<Photo>>> getPhotos(String query);
}
