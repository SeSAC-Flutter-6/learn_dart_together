import 'package:learn_dart_together/15_dto/photo_assingment/datasource/photo_data_source.dart';
import 'package:learn_dart_together/15_dto/photo_assingment/dto/photo_dto.dart';
import 'package:learn_dart_together/15_dto/photo_assingment/mapper/photo_mapper.dart';
import 'package:learn_dart_together/15_dto/photo_assingment/model/photo.dart';
import 'package:learn_dart_together/15_dto/photo_assingment/repository/photo_repository.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  final PhotoDataSource _photoDataSource;

  PhotoRepositoryImpl(this._photoDataSource);

  @override
  Future<Photo?> getPhoto(int id) async {
    final photoDto = await _photoDataSource.getPhoto(id);

    return photoDto?.toPhoto();
  }

  @override
  Future<List<Photo>> getPhotos() async {
    final photoDto = await _photoDataSource.getPhotos();

    return photoDto.map((dto) => dto.toPhoto()).toList();
  }
}
