import 'package:learn_dart_together/15_dto/photo_assingment/dto/photo_dto.dart';

abstract interface class PhotoDataSource {
  Future<List<PhotoDto>> getPhotos();

  Future<PhotoDto?> getPhoto(int id);
}
