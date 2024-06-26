import 'package:learn_dart_together/19_model_repository/model/album.dart';

abstract interface class AlbumRepository {
  Future<List<Album>> getAlbums();

  Future<List<Album>> getAlbumsTop10();
}
