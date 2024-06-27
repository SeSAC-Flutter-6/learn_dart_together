import 'package:learn_dart_together/13_model_repository/data/model/album.dart';

abstract interface class AlbumRepository {
  Future<List<Album>> getAlbums();
  Future<List<Album>> getAlbumsTop10();
}
