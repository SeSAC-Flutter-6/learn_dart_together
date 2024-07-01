import 'package:learn_dart_together/17_dto/data_source/photo_api.dart';
import 'package:learn_dart_together/17_dto/mapper/photo_mapper.dart';
import 'package:learn_dart_together/17_dto/model/photo.dart';

abstract interface class PhotoRepository {
  Future<List<Photo>> getPhotos();
}

class PhotoRepositoryImpl implements PhotoRepository {
  final PhotoApi _photoApi;

  PhotoRepositoryImpl(this._photoApi);

  @override
  Future<List<Photo>> getPhotos() async {
    final photoDto = await _photoApi.getPhotos();
    final photos = photoDto.map((dto) => dto.toPhoto()).toList();
    return List.unmodifiable(photos);
  }
}
