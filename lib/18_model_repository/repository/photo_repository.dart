import 'package:learn_dart_together/18_model_repository/model/photos.dart';

abstract interface class PhotoRepository {
  Future<List<Photo>> getPhotos(int albumId);
}
