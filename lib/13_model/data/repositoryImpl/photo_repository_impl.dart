import 'package:learn_dart_together/13_model/data/data_source/photo_data_source.dart';
import 'package:learn_dart_together/13_model/data/model/photo.dart';
import 'package:learn_dart_together/13_model/data/repository/photo_repository.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  final PhotoDataSource _photoDataSource;

  PhotoRepositoryImpl(this._photoDataSource);

  @override
  Future<List<Photo>> getPhotos(int albumId) =>
      _photoDataSource.getPhotos(albumId);
}
