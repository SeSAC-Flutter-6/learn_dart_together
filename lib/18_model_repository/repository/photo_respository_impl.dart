import 'package:learn_dart_together/18_model_repository/data_source/photos_data_source.dart';
import 'package:learn_dart_together/18_model_repository/model/photos.dart';
import 'package:learn_dart_together/18_model_repository/repository/photo_repository.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  @override
  Future<List<Photo>> getPhotos(int albumId) async {
    PhotoApi photoApi = PhotoApi();
    final List<Photo> photos = await photoApi.getPhotos();
    List<Photo> albumIdphotos =
        photos.where((e) => albumId.toString() == e.albumId).toList();
    return albumIdphotos;
  }
}
