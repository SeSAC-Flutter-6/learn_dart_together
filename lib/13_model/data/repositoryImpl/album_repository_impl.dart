import 'package:learn_dart_together/13_model/data/data_source/album_data_source.dart';
import 'package:learn_dart_together/13_model/data/model/album.dart';
import 'package:learn_dart_together/13_model/data/repository/album_repository.dart';

class AlbumRepositoryimpl implements AlbumRepository {
  final AlbumDataSource _albumDataSource;

  AlbumRepositoryimpl(this._albumDataSource);

  @override
  Future<List<Album>> getAlbums() => _albumDataSource.getAlbums();

  @override
  Future<List<Album>> getAlbumsTop10() async {
    final getAlbums = await _albumDataSource.getAlbums();
    return getAlbums.take(10).toList();
  }
}
