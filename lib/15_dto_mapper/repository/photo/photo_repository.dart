import 'package:learn_dart_together/15_dto_mapper/model/photo.dart';

abstract interface class PhotoRepository {
  Future<List<Photo>> getPhotos();
  Future<Photo?> getPhoto(int id);
}
