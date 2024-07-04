import 'package:learn_dart_together/18_test/18_dto_mapper/practice_03/dto/jphoto_dto.dart';

abstract interface class MediaDataSource {
  Future<List<PhotoDto>> getPhotos();

  Future<PhotoDto?> getPhoto(int id);

}