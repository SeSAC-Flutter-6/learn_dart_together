import 'package:learn_dart_together/19_model_repository/model/photo.dart';

abstract interface class PhotoRepository {
  Future<List<Photo>> getPhotos(int albumId);
}
