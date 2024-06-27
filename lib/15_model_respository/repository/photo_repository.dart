import 'package:learn_dart_together/15_model_respository/data_source/photo_data_source.dart';
import '../model/photo.dart';

abstract interface class PhotoRepository {
  Future<List<Photo>> getPhotos(int albumId);
}

class PhotoRepositoryImpl implements PhotoRepository {
  final _dataSource = PhotoDataSource();

  @override
  Future<List<Photo>> getPhotos(int albumId) async {
    return (await _dataSource.fetchPhotos())
        .where((e) => e.albumId == albumId)
        .toList();
  }
}
