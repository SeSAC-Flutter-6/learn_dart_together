import 'package:learn_dart_together/19_result/core/result.dart';
import 'package:learn_dart_together/19_result/photo/data_source/photo_data_source.dart';
import 'package:learn_dart_together/19_result/photo/mapper/photo_mapper.dart';
import 'package:learn_dart_together/19_result/photo/model/photo.dart';

abstract interface class PhotoRepository {
  Future<Result<List<Photo>, String>> getPhotos(String query);
}

class PhotoRepositoryImpl implements PhotoRepository {
  final PhotoDataSource _photoDataSource;

  PhotoRepositoryImpl(this._photoDataSource);

  @override
  Future<Result<List<Photo>, String>> getPhotos(String query) async {
    if (query == '바보') return Result.error('비속어를 사용할 수 없습니다');

    final result = await _photoDataSource.getPhotos(query);
    return result.when(
      success: (dtos) {
        final photos = dtos.map((e) => e.toPhoto()).toList();
        return Result.success(photos);
      },
      error: (e) {
        return Result.error('알 수 없는 네트워크 에러');
      },
    );
  }
}
