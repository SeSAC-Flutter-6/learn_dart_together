import 'package:learn_dart_together/20_ressult/practice_2/dto/photo_result_dto.dart';
import 'package:learn_dart_together/20_ressult/practice_2/model/photo.dart';

abstract interface class PhotoDataSource {
  Future<List<PhotoDto>> getPhotos(String query);
}
