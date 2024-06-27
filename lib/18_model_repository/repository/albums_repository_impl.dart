import 'package:learn_dart_together/18_model_repository/data_source/album_data_source.dart';
import 'package:learn_dart_together/18_model_repository/model/albums.dart';
import 'package:learn_dart_together/18_model_repository/repository/albums_repository.dart';

class AlbumsRepositoryImpl implements AlbumsRepository {
  @override
  Future<List<Album>> getAlbums() async {
    AlbumsApi albumsApi = AlbumsApi();
    return await albumsApi.getAlbums();
  }

  Future<List<Album>> getAlbumsTop10() async {
    AlbumsApi albumsApi = AlbumsApi();
    return await albumsApi.getAlbumsTop10();
  }
}
