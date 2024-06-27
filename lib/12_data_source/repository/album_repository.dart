import 'package:learn_dart_together/12_data_source/data_source/album_data_source.dart';
import 'package:learn_dart_together/12_data_source/model/album.dart';

abstract interface class AlbumRepository {
  Future<List<Album>> getAlbums();
  Future<List<Album>> getAlbumsTop10();
}

final class AlbumRepositoryImpl implements AlbumRepository {
  final AlbumDataSource _albumDataSource;

  AlbumRepositoryImpl(this._albumDataSource);

  @override
  Future<List<Album>> getAllComments(int postId) => _albumDataSource.getAlbums();

  @override
  Future<List<Album>> getAlbums() => _albumDataSource.getAlbums();

  @override
  Future<List<Album>> getAlbumsTop10() => _albumDataSource.getAlbumsTop10();
}