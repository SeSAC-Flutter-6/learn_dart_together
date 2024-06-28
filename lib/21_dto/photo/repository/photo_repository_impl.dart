import 'package:learn_dart_together/21_dto/photo/data_source/photo_data_source.dart';
import 'package:learn_dart_together/21_dto/photo/mapper/photo_mapper.dart';
import 'package:learn_dart_together/21_dto/photo/model/photo.dart';
import 'package:learn_dart_together/21_dto/photo/repository/photo_repository.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  final PhotoDataSource _photoDataSource;

  PhotoRepositoryImpl(this._photoDataSource);

  @override
  Future<List<Photo>> getPhotos() async {
    final data = await _photoDataSource.getPhotoDto();
    return data.map((e) => e.toPhoto()).toList();
  }
}
