import 'package:collection/collection.dart';
import 'package:learn_dart_together/17_factory_singleton/model/album_model.dart';
import 'package:learn_dart_together/17_factory_singleton/repository/album_repository.dart';
import 'package:learn_dart_together/data_source/data_source.dart';

class AlbumRepositoryImpl implements AlbumRepository {
  final AlbumDataSource albumDataSource;

  AlbumRepositoryImpl(this.albumDataSource);

  @override
  Future<List<Album>> getAlbums() => albumDataSource.getAlbums();
  Future<List<Album>> getAlbumsTop10() async {
   //getAlbumsTop10()은 리스트 형태인가?
    List<Album> albums = await albumDataSource.getAlbums();
    //오? 이렇게 하면 담기는건가
    return albums.sorted((a,b) => a.id.compareTo(b.id)).sublist(0,10);
  }
}

void main() async {
  final AlbumDataSource albumDataSource = AlbumDataSource();
  final albumRepositoryImpl = await AlbumRepositoryImpl(albumDataSource).getAlbumsTop10();
  print(albumRepositoryImpl);
}
