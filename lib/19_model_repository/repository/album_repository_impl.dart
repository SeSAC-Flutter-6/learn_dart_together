import 'package:collection/collection.dart';
import 'package:learn_dart_together/19_model_repository/data_source/album_data_source.dart';
import 'package:learn_dart_together/19_model_repository/model/album.dart';
import 'package:learn_dart_together/19_model_repository/repository/album_repository.dart';

class AlbumRepositoryImpl implements AlbumRepository {
  final AlbumDataSource _albumDataSource;

  AlbumRepositoryImpl(this._albumDataSource);

  @override
  Future<List<Album>> getAlbums() async {
    return await _albumDataSource.getData();
  }

  @override
  Future<List<Album>> getAlbumsTop10() async {
    final data = await _albumDataSource.getData();
    return data.sorted((a, b) => a.id.compareTo(b.id)).take(10).toList();
  }
}
