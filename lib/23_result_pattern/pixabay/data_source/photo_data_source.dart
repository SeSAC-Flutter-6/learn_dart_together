import 'package:learn_dart_together/23_result_pattern/pixabay/dto/photo_dto.dart';

abstract interface class PhotoDataSource {
  Future<List<Hits>> getPhotoDto(String query);
}
