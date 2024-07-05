import 'package:learn_dart_together/17_result/image_search/data_source/image_search_api.dart';
import 'package:learn_dart_together/17_result/image_search/dto/photo_result_dto.dart';

class MockNetworkImageSearchApiImpl implements ImageSearchApi {

  @override
  Future<List<PhotoDto>> getPhotos(String query) async {
    throw Exception('네트워크 에러');
  }
}
