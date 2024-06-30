import 'package:learn_dart_together/18_dto_mapper/practice_3/data_source/mock_photo_api.dart';
import 'package:learn_dart_together/18_dto_mapper/practice_3/data_source/photo_data_source.dart';
import 'package:learn_dart_together/18_dto_mapper/practice_3/repository/photo_repository.dart';
import 'package:learn_dart_together/18_dto_mapper/practice_3/repository/photo_repository_impl.dart';

void main() async {
  PhotoDataSource mockPhotoApi = MockPhotoApi();
  PhotoRepository photoRepositoryImpl = PhotoRepositoryImpl(mockPhotoApi);

  (await photoRepositoryImpl.getAllPhotos()).forEach(print);
}
