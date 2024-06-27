import 'package:learn_dart_together/16_model_repository/datasource/photo_data_source.dart';
import 'package:learn_dart_together/16_model_repository/model/photo.dart';
import 'package:learn_dart_together/16_model_repository/repository/photo_repository.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  final PhotoDataSource _photoDataSource;

  PhotoRepositoryImpl(this._photoDataSource);

  @override
  Future<List<Photo>> getPhotos(int albumId) async {
    List<Photo> photos = await _photoDataSource.getPhotos(albumId);
    return photos.where((e) => e.albumId == albumId).toList();
  }
}
