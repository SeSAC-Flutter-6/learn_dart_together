

import 'package:learn_dart_together/12_data_source/data_source/photo_data_source.dart';
import 'package:learn_dart_together/12_data_source/model/photo.dart';

abstract interface class PhotoRepository {
  Future<List<Photo>> getPhotos(int albumId);
}

final class PhotoRepositoryImpl implements PhotoRepository {
  final PhotoDataSource _photoDataSource;

  PhotoRepositoryImpl(this._photoDataSource);

  @override
  Future<List<Photo>> getPhotos(int albumId) => _photoDataSource.getPhotos(albumId);
}