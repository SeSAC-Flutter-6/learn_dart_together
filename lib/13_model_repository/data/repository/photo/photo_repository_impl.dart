import 'package:learn_dart_together/13_model_repository/data/data_source/photo_api.dart';
import 'package:learn_dart_together/13_model_repository/data/model/photo.dart';
import 'package:learn_dart_together/13_model_repository/data/repository/photo/photo_repository.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  final _photoApi = PhotoApi();

  @override
  Future<List<Photo>> getPhotosByAlbumId(int albumId) async {
    try {
      final List<dynamic> photoDataList =
          await _photoApi.fetchDataByAlbumId(albumId);
      return photoDataList.map<Photo>((json) => Photo.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to getPhotosByAlbumId for post ID $albumId: $e');
    }
  }

  @override
  Future<List<Photo>> getPhotos() async {
    try {
      final List<dynamic> photoDataList = await _photoApi.fetchAllData();
      return photoDataList.map<Photo>((json) => Photo.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to getPhotos: $e');
    }
  }
}
