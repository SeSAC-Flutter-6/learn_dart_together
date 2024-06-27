import 'package:learn_dart_together/15_model_respository/data_source/album_data_source.dart';
import '../model/album.dart';

abstract interface class AlbumRepository {
  Future<List<Album>> getAlbums();
  Future<List<Album>> getAlbumsTop10();
}

class AlbumRepositoryImpl implements AlbumRepository {
  final _dataSource = AlbumDataSource();

  @override
  Future<List<Album>> getAlbums() async {
    return await _dataSource.fetchAlbums();
  }

  @override
  Future<List<Album>> getAlbumsTop10() async {
    return (await getAlbums()).take(10).toList();
  }
}
