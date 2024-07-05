import 'dart:async';

import 'package:learn_dart_together/16_result/photo_data_source.dart';
import 'package:learn_dart_together/16_result/photo_dto.dart';

class UnknownPhotoDataSourceImpl implements PhotoDataSource {
  @override
  Future<List<PhotoDTO>> getPhotos(String query) async {
    throw Exception('알 수 없는 네트워크 에러');
  }
}