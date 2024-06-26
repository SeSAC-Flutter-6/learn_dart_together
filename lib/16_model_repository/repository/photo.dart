import 'package:learn_dart_together/16_model_repository/data_source/photos.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  @override
  Future<List<Photo>> getPhotos(int albumId) async {
    final results = await PhotoDataSource().getPhotoList();
    List<Photo> filteredPhoto =
        results.where((photo) => photo.albumId == albumId).toList();
    return filteredPhoto;
  }
}

abstract interface class PhotoRepository {
  Future<List<Photo>> getPhotos(int albumId);
}
