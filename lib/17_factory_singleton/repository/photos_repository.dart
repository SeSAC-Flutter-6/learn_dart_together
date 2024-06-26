import 'package:learn_dart_together/17_factory_singleton/model/photo_model.dart';

abstract interface class PhotosRepository {
  Future<List<Photo>> getPhotos(int albumId);

}