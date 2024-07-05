import 'package:learn_dart_together/16_result/photo_dto.dart';

abstract interface class PhotoDataSource {
  Future<List<PhotoDTO>> getPhotos(String query);
}