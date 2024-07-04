import 'package:http/http.dart';

import 'package:learn_dart_together/20_ressult/practice_2/data_source/photo_data_source.dart';
import 'package:learn_dart_together/20_ressult/practice_2/dto/photo_result_dto.dart';

class MockClientExceptionPhotoApi implements PhotoDataSource {
  @override
  Future<List<PhotoDto>> getPhotos(String query) async {
    throw ClientException('ClientExceptionPhotoApi');
  }
}
