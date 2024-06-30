import 'package:learn_dart_together/18_dto_mapper/practice_3/dto/photo_dto.dart';

abstract interface class PhotoDataSource {
  Future<List<PhotoDto>> getAllPhotos();
}
