import 'package:learn_dart_together/13_model/data/model/photo.dart';

abstract interface class PhotoRepository {
  Future<List<Photo>> getPhotos(int albumId);
}
