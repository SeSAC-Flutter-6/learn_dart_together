import 'package:learn_dart_together/21_dto/photo/model/photo.dart';

abstract interface class PhotoRepository {
  Future<List<Photo>> getPhotos();
}
