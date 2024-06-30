import 'package:learn_dart_together/18_dto_mapper/practice_3/model/photo.dart';

abstract interface class PhotoRepository {
  Future<List<Photo>> getAllPhotos();
}
