import 'package:learn_dart_together/20_result/core/result.dart';

import '../dto/photo_dto.dart';

abstract interface class PhotoDataSource {
  Future<List<PhotoDto>> getPhoto(String query);
}
