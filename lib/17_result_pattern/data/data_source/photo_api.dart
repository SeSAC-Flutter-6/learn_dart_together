import 'package:learn_dart_together/17_result_pattern/data/dto/photo_dto/photo_dto.dart';

abstract interface class PhotoApi {
  Future<List<PhotoDto>> searchPhotos(
      {required String firstKeyword, String? secondKeyword});
}
