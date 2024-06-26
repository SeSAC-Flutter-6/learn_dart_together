import 'package:learn_dart_together/13_model_repository/data/model/album.dart';
import 'package:learn_dart_together/13_model_repository/data/model/comment.dart';
import 'package:learn_dart_together/13_model_repository/data/repository/album_repository_impl.dart';
import 'package:learn_dart_together/13_model_repository/data/repository/comment_repository.dart';
import 'package:learn_dart_together/13_model_repository/data/repository/comment_repository_impl.dart';
import 'package:test/test.dart';
Future<void> main() async {
  final commentRepository = CommentRepositoryImpl();
  final albumRepository = AlbumRepositoryImpl();

  //문제 1
  List<Comment> comments = await commentRepository.getCommentsByPostId(1);
  print(comments);

  //문제 2
  List<Album> albums = await albumRepository.getAlbums();
  print(albums);

  List<Album> top10Album = await albumRepository.getAlbumsTop10();
  print(top10Album.length==10); //true

  //문제 3
}
