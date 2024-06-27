import 'package:learn_dart_together/16_model_repository/datasource/album_data_source.dart';
import 'package:learn_dart_together/16_model_repository/model/album.dart';
import 'package:learn_dart_together/16_model_repository/repository/album_repository.dart';

class AlbumRepositoryImpl implements AlbumRepository {
  final AlbumDataSource _albumDataSource;

  AlbumRepositoryImpl(this._albumDataSource);

  @override
  Future<List<Album>> getAlbums() => _albumDataSource.getAlbums();

  @override
  Future<List<Album>> getAlbumsTop10() async {
    final List<Album> albums = await _albumDataSource.getAlbums();
    return albums.take(10).toList();
  }
}
