import 'package:learn_dart_together/22_result/data/photo_data_source.dart';
import 'package:learn_dart_together/22_result/dto/photo_dto.dart';
import 'package:learn_dart_together/22_result/mapper/photo_mapper.dart';
import 'package:learn_dart_together/22_result/model/photo.dart';
import 'package:learn_dart_together/22_result/repository/photo_repository.dart';
import 'package:learn_dart_together/22_result/result.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  final PhotoDataSource _photoDataSource;

  PhotoRepositoryImpl({
    required PhotoDataSource photoDataSource,
  }) : _photoDataSource = photoDataSource;

  @override
  Future<Result<List<Photo>>> getPhotos(String query) async {
    try {
      if (query == '바보') {
        return Result.error('비속어를 사용할 수 없습니다');
      }
      
      List<Hits> data = await _photoDataSource.getPhotoData(query);
      List<Photo> photos = data.map((e) => e.hits()).toList();
      
      return Result.success(photos);
    } catch (e) {
      return Result.error('알 수 없는 네트워크 에러');
    }
  }
}
