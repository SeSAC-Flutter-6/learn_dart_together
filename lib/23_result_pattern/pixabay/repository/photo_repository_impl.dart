import 'package:learn_dart_together/23_result_pattern/pixabay/data_source/photo_data_source.dart';
import 'package:learn_dart_together/23_result_pattern/pixabay/data_source/photo_data_source_impl.dart';
import 'package:learn_dart_together/23_result_pattern/pixabay/dto/photo_dto.dart';
import 'package:learn_dart_together/23_result_pattern/pixabay/mapper/photo_mapper.dart';
import 'package:learn_dart_together/23_result_pattern/pixabay/model/photo.dart';
import 'package:learn_dart_together/23_result_pattern/pixabay/repository/photo_repository.dart';

import '../core/result.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  PhotoDataSource _photoDataSource;

  PhotoRepositoryImpl({
    required PhotoDataSource photoDataSource,
  }) : _photoDataSource = photoDataSource;

  @override
  Future<Result<List<Photo>>> getPhotos(String query) async {
    if (query == '바보') {
      return Result.error('비속어를 사용할 수 없습니다.');
    }
    try {
      final List<Hits> data = await _photoDataSource.getPhotoDto(query);
      final List<Photo> list = data.map((e) => e.toPhoto()).toList();
      return Result.success(list);
    } catch (e) {
      return Result.error('알 수 없는 네트워크 에러');
    }
  }
}

void main() async {
  final data = await PhotoRepositoryImpl(photoDataSource: PhotoDataSourceImpl())
      .getPhotos('나비');
  switch (data) {
    case Success<List<Photo>>():
      print(data.data);
    case Error<List<Photo>>():
      print(data.error);
  }
}
