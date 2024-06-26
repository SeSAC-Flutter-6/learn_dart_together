import 'package:learn_dart_together/16_model_repository/repository/album.dart';
import 'package:learn_dart_together/16_model_repository/repository/comment.dart';
import 'package:learn_dart_together/16_model_repository/repository/photo.dart';
import 'package:learn_dart_together/16_model_repository/repository/post.dart';
import 'package:learn_dart_together/16_model_repository/repository/todo.dart';
import 'package:learn_dart_together/16_model_repository/repository/user.dart';

void main() async {
  final comment = await CommentRepositoryImpl().getComments(2);
  // print(comment);
  final album = await AlbumRepositoryImpl().getAlbums();
  // print(album);
  final albumTop10 = await AlbumRepositoryImpl().getAlbumsTop(10);
  // print(albumTop10);
  final photos = await PhotoRepositoryImpl().getPhotos(1);
  // print(photos);
  final todos = await TodoRepositoryImpl().getTodos();
  // print(todos);
  final completedTodos = await TodoRepositoryImpl().getCompletedTodos();
  // print(completedTodos);
  final users = await UserRepositoryImpl().getUsers();
  // print(completedTodos);
  final usersTop10ByUserName =
      await UserRepositoryImpl().getUsersTop10ByUserName();
  // print(usersTop10ByUserName);
  final postList = await PostRepositoryImpl().getPosts(page: 2, limit: 3);
  print(postList);
}
