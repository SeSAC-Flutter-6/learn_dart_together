import 'package:learn_dart_together/17_factory_singleton/model/photo_model.dart';
import 'package:learn_dart_together/17_factory_singleton/repository/photos_repository.dart';
import 'package:learn_dart_together/data_source/data_source.dart';

class PhotoRepositoryImpl implements PhotosRepository {
  final PhotoDataSource photoDataSource;

  PhotoRepositoryImpl(this.photoDataSource);

  //왜 익스프레션 바디로 만들어야 에러가 없어질까?
  @override
  Future<List<Photo>> getPhotos(int albumId) async =>
      photoDataSource.getPhotos(albumId);
}
