import 'package:learn_dart_together/13_model/data/data_source/album_data_source.dart';
import 'package:learn_dart_together/13_model/data/model/album.dart';
import 'package:learn_dart_together/13_model/data/model/comment.dart';
import 'package:learn_dart_together/13_model/data/repository/album_repository.dart';

class Albumrepositoryimpl implements Albumrepository {
  final AlbumDataSource _albumDataSource;

  Albumrepositoryimpl(this._albumDataSource);

  @override
  Future<List<Album>> getAlbums() => _albumDataSource.getAlbums();

  @override
  Future<List<Album>> getAlbumsTop10() => _albumDataSource.getAlbumsTop10();
}
