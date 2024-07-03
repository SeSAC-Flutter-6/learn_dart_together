import 'package:learn_dart_together/21_dto/photo/dto/photo_dto.dart';

abstract interface class PhotoDataSource {
  Future<List<PhotoDto>> getPhotoDto();
}
