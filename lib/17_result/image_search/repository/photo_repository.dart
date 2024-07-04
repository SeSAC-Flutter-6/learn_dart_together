import 'package:learn_dart_together/17_result/image_search/core/result.dart';
import 'package:learn_dart_together/17_result/image_search/exception/network_error.dart';
import 'package:learn_dart_together/17_result/image_search/model/photo.dart';

abstract interface class PhotoRepository {
  Future<Result<List<Photo>, ErrorList>> getPhotos(String query);
}
