import './album_repository.dart';
import '../model/album.dart';
import 'package:learn_dart_together/data_source/base_data_source.dart';

class AlbumRepositoryImpl implements AlbumRepository {
  final BaseDataSource _baseDataSource;

  AlbumRepositoryImpl(this._baseDataSource);

  @override
  Future<List<Album>> getAlbums() async {
    return _baseDataSource.fetchData<Album>(
      'https://jsonplaceholder.typicode.com/Albums',
      (json) => Album.fromJson(json),
    );
  }

  @override
  Future<List<Album>> getAlbumsTop10() async {
    List<Album> allAlbums = await getAlbums();
    return allAlbums.sublist(0, 10);
  }
}
