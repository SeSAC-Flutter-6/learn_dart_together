import 'package:learn_dart_together/15_dto_mapper/model/photo/photo.dart';

abstract interface class PhotoRepository {
  Future<List<Photo>> getPhotos();
}
