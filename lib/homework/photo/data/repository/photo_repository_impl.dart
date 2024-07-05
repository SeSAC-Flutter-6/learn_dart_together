import 'package:learn_dart_together/homework/photo/data/datasource/photo_data_source.dart';
import 'package:learn_dart_together/homework/photo/data/mapper/photo_mapper.dart';
import 'package:learn_dart_together/homework/photo/data/model/photo.dart';
import 'package:learn_dart_together/homework/photo/data/repository/photo_repository.dart';

import '../../../core/result.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  final PhotoDataSource _photoDataSource;

  PhotoRepositoryImpl(this._photoDataSource);

  @override
  Future<Result<List<Photo>>> getPhotos(String query) async {
    if (query == '바보') {
      return Result.error('비속어를 사용할 수 없습니다.');
    }
    try {
      final photoDtoList = await _photoDataSource.getPhotos(query);
      return Result.success(photoDtoList.map((e) => e.toPhoto()).toList());
    } catch (e) {
      return Result.error('알 수 없는 네트워크 에러');
    }
  }
}
