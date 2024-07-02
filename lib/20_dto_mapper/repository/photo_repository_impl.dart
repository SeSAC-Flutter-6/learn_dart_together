import 'package:learn_dart_together/20_dto_mapper/data_source/mock_photo_api.dart';
import 'package:learn_dart_together/20_dto_mapper/model/photo.dart';
import 'package:learn_dart_together/20_dto_mapper/repository/photo_repository.dart';
import 'package:learn_dart_together/20_dto_mapper/mapper/photo_mapper.dart';
import 'package:learn_dart_together/20_dto_mapper/dto/photo_dto.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  @override
  Future<List<Photo>> getPhoto() async {
    MockPhotoApi mockPhotoApi = MockPhotoApi();
    final List<PhotoDto> photoDtos = await mockPhotoApi.getPhoto();
    final List<Photo> photo = photoDtos.map((dto) => dto.toPhoto()).toList();

    return photo;
  }
}
