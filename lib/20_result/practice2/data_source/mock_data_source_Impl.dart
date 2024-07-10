import 'package:learn_dart_together/20_result/core/result.dart';
import 'package:learn_dart_together/20_result/practice2/data_source/photo_data_source.dart';
import 'package:learn_dart_together/20_result/practice2/dto/photo_dto.dart';

class MockDataSourceImpl implements PhotoDataSource {
  @override
  Future<List<PhotoDto>> getPhoto(String query) {
    // TODO: implement getPhoto
    throw UnimplementedError();
  }
}
