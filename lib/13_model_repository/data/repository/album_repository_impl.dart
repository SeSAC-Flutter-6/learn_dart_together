import 'package:learn_dart_together/13_model_repository/data/data_source/album_api.dart';
import 'package:learn_dart_together/13_model_repository/data/model/album.dart';
import 'package:learn_dart_together/13_model_repository/data/repository/album_repository.dart';

class AlbumRepositoryImpl implements AlbumRepository {
  final _albumApi = AlbumApi();
  @override
  Future<List<Album>> getAlbums() async {
    try {
      final List<dynamic> albumDataList = await _albumApi.fetchAllData();
      return albumDataList.map<Album>((json) => Album.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to getAlbums: $e');
    }
  }

  @override
  Future<List<Album>> getAlbumsTop10() async {
    try {
      final List<dynamic> albumDataList = await _albumApi.fetchAllData();
      final List<Album> top10Albums = albumDataList
          .take(10)
          .map<Album>((json) => Album.fromJson(json))
          .toList();
      return top10Albums;
    } catch (e) {
      throw Exception('Failed to getAlbumsTop10: $e');
    }
  }
}
