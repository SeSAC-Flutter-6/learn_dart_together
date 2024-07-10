import 'package:learn_dart_together/20_result/core/result.dart';
import 'package:learn_dart_together/20_result/practice2/data_source/photo_data_source.dart';
import 'package:learn_dart_together/20_result/practice2/mapper/photo_mapper.dart';
import 'package:learn_dart_together/20_result/practice2/model/photo.dart';
import 'package:learn_dart_together/20_result/practice2/repository/photo_repository.dart';
import '../dto/photo_dto.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  final PhotoDataSource _photoDataSource;

  PhotoRepositoryImpl({
    required PhotoDataSource photoDataSource,
  }) : _photoDataSource = photoDataSource;

  @override
  Future<Result<List<Photo>, String>> getPhotos(String query) async {
    if (query == '바보') {
      return Result.error('비속어를 사용할 수 없습니다.');
    }
    try {
      final List<PhotoDto> dtoList = await _photoDataSource.getPhoto(query);
      final List<Photo> data = dtoList.map((e) => e.toPhoto()).toList();
      return Result.success(data);
    } catch (e) {
      return Result.error(e.toString());
    }
  }
}
