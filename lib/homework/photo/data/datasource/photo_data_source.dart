import 'package:learn_dart_together/homework/photo/data/dto/photo_dto.dart';

abstract interface class PhotoDataSource {
  Future<List<PhotoResultDto>> getPhotos(String query);
}
