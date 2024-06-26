import 'package:learn_dart_together/16_model_repository/data_source/albums.dart';

import '../model/album.dart';

class AlbumRepositoryImpl implements AlbumRepository {
  @override
  Future<List<Album>> getAlbums() async {
    final results = await AlbumDataSource().getAlbumList();
    return results;
  }

  @override
  Future<List<Album>> getAlbumsTop(int top) async {
    final results = await AlbumDataSource().getAlbumList();
    final List<Album> filteredAlbums =
        results.where((album) => album.id <= top).toList();
    return filteredAlbums;
  }
}

abstract interface class AlbumRepository {
  Future<List<Album>> getAlbums();

  Future<List<Album>> getAlbumsTop(int top);
}
