import 'package:learn_dart_together/12_data_source/data_source/album_data_source.dart';
import 'package:learn_dart_together/12_data_source/data_source/comment_data_source.dart';
import 'package:learn_dart_together/12_data_source/data_source/photo_data_source.dart';
import 'package:learn_dart_together/12_data_source/data_source/todo_data_source.dart';
import 'package:learn_dart_together/12_data_source/data_source/user_data_source.dart';
import 'package:learn_dart_together/12_data_source/repository/album_repository.dart';
import 'package:learn_dart_together/12_data_source/repository/comment_repository.dart';
import 'package:learn_dart_together/12_data_source/repository/photo_repository.dart';

Future<void> main() async {
  // final comment_datasource = CommentDataSource();
  // final commentRepository = CommentRepositoryImpl(comment_datasource);
  // final comments = await commentRepository.getAllComments(1);
  // comments.forEach((e) => print(e.id));
  //
  // final album_datasource = AlbumDataSource();
  // final albumRepo = AlbumRepositoryImpl(album_datasource);
  // final albums = await albumRepo.getAlbums();
  // final albumsTop10 = await albumRepo.getAlbumsTop10();
  //
  // albums.forEach((e) => print(e.title));
  // albumsTop10.forEach((e) => print(e.title));

  final photo_dataSource = PhotoDataSource();
  final photoRepository = PhotoRepositoryImpl(photo_dataSource);
  final photos = await photoRepository.getPhotos(1);

  photos.forEach((e) => print(e.albumId));
}