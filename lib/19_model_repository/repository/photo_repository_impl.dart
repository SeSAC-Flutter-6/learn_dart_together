import 'package:learn_dart_together/19_model_repository/data_source/photo_data_source.dart';
import 'package:learn_dart_together/19_model_repository/model/photo.dart';
import 'package:learn_dart_together/19_model_repository/repository/photo_repository.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  final PhotoDataSource _photoDataSource;

  PhotoRepositoryImpl(this._photoDataSource);

  @override
  Future<List<Photo>> getPhotos(int albumId) async {
    final data = await _photoDataSource.getData();
    return data.where((e) => e.albumId == albumId).toList();
  }
}
