import 'dart:async';

import 'package:learn_dart_together/16_result/photo_data_source.dart';
import 'package:learn_dart_together/16_result/photo_dto.dart';

class TimeoutPhotoDataSourceImpl implements PhotoDataSource {
  @override
  Future<List<PhotoDTO>> getPhotos(String query) async {
    throw TimeoutException('');
  }
}