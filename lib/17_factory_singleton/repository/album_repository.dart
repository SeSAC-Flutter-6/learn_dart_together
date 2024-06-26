import 'package:learn_dart_together/17_factory_singleton/model/album_model.dart';

abstract interface class AlbumRepository {
  Future<List<Album>> getAlbums();
}
