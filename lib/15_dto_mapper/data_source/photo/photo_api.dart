import 'package:learn_dart_together/15_dto_mapper/dto/photo_dto/photo_dto.dart';

abstract interface class PhotoApi {
  Future<List<PhotoDto>> getPhotos();
}
