import 'package:learn_dart_together/18_model_repository/model/albums.dart';

abstract interface class AlbumsRepository {
  Future<List<Album>> getAlbums();
  Future<List<Album>> getAlbumsTop10();
}
