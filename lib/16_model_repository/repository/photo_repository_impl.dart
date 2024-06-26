import './photo_repository.dart';
import '../model/photo.dart';
import 'package:learn_dart_together/data_source/base_data_source.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  final BaseDataSource _baseDataSource;

  PhotoRepositoryImpl(this._baseDataSource);

  @override
  Future<List<Photo>> getPhotos(int albumId) async {
    return _baseDataSource.fetchData<Photo>(
      'https://jsonplaceholder.typicode.com/photos?albumId=$albumId',
      (json) => Photo.fromJson(json),
    );
  }
}
