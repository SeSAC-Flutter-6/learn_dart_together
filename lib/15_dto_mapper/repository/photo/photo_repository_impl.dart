import 'package:learn_dart_together/15_dto_mapper/data_source/photo/photo_api.dart';
import 'package:learn_dart_together/15_dto_mapper/dto/photo_dto/photo_dto.dart';
import 'package:learn_dart_together/15_dto_mapper/mapper/photo_mapper.dart';
import 'package:learn_dart_together/15_dto_mapper/model/photo.dart';
import 'package:learn_dart_together/15_dto_mapper/repository/photo/photo_repository.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  final PhotoApi _photoApi;

  const PhotoRepositoryImpl({
    required PhotoApi photoApi,
  }) : _photoApi = photoApi;

  @override
  Future<Photo?> getPhoto(int id) async {
    try {
      List<Photo> allPhotos = await getPhotos();
      for (var photo in allPhotos) {
        if (photo.id == id) {
          return photo;
        }
      }
      return null;
    } catch (error) {
      throw Exception('Error getting getUserbyName: $error');
    }
  }

  @override
  Future<List<Photo>> getPhotos() async {
    try {
      List<PhotoDto> photoDtos = await _photoApi.getPhotos();
      List<Photo> photos = photoDtos.map((dto) => dto.toPhoto()).toList();
      return photos;
    } catch (error) {
      throw Exception('Error getting users: $error');
    }
  }
}
