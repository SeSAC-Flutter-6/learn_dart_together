import 'package:learn_dart_together/18_dto_mapper/practice_3/data_source/photo_data_source.dart';
import 'package:learn_dart_together/18_dto_mapper/practice_3/model/photo.dart';
import 'package:learn_dart_together/18_dto_mapper/practice_3/repository/photo_repository.dart';
import 'package:learn_dart_together/18_dto_mapper/practice_3/mapper/content_mapper.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  final PhotoDataSource _photoDataSource;

  PhotoRepositoryImpl(this._photoDataSource);

  @override
  Future<List<Photo>> getAllPhotos() async {
    return (await _photoDataSource.getAllPhotos())
        .map((e) => e.toPhoto())
        .toList();
  }
}
