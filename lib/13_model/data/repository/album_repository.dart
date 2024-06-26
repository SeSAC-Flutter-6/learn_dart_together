import 'package:learn_dart_together/13_model/data/model/album.dart';

abstract interface class Albumrepository {
  Future<List<Album>> getAlbums();
  Future<List<Album>> getAlbumsTop10();
}
