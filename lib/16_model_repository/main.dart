import 'dart:math';

import 'package:learn_dart_together/data_source/base_data_source.dart';

import './repository/album_repository_impl.dart';
import './repository/comment_repository_impl.dart';
import './repository/photo_repository_impl.dart';
import './repository/todo_repository_impl.dart';
import './repository/user_repository_impl.dart';
import './repository/post_repository_impl.dart';

import './model/comment.dart';
import './model/album.dart';
import './model/photo.dart';
import './model/todo.dart';
import './model/user.dart';
import './model/post.dart';

void main() async {
  BaseDataSource baseDataSource = BaseDataSource();

  // 과제1
  // CommentRepositoryImpl commentRepository =
  //     CommentRepositoryImpl(baseDataSource);

  // int postId = 5;
  // List<Comment> comments = await commentRepository.getComments(postId);

  // print('Comments for post ID $postId:');
  // for (Comment comment in comments) {
  //   print('Comment ID: ${comment.id}, Content: ${comment.email}');
  // }

  // 과제2
  AlbumRepositoryImpl albumRepository = AlbumRepositoryImpl(baseDataSource);

  List<Album> albums = await albumRepository.getAlbums();
  List<Album> albumsTop10 = await albumRepository.getAlbumsTop10();

  albums.forEach(print);
  albumsTop10.forEach(print);

  // 과제3
  // PhotoRepositoryImpl photoRepository = PhotoRepositoryImpl(baseDataSource);

  // int albumId = 4;
  // List<Photo> photos = await photoRepository.getPhotos(albumId);

  // print('Photos for album ID $albumId:');
  // for (Photo photo in photos) {
  //   print('Photo ID: ${photo.id}, Title: ${photo.title}');
  // }

  // 과제4
  // TodoRepositoryImpl todoRepository = TodoRepositoryImpl(baseDataSource);

  // List<Todo> todos = await todoRepository.getTodos();
  // List<Todo> completedTodos = await todoRepository.getCompletedTodos();

  // print('All Todos:');
  // todos.forEach(print);

  // print('Completed Todos:');
  // for (var e in completedTodos) {
  //   print('Title: ${e.title}, Completed: ${e.completed}');
  // }

  // 과제 5
  // UserRepositoryImpl userRepository = UserRepositoryImpl(baseDataSource);

  // List<User> users = await userRepository.getUsers();
  // List<User> usersTop10ByUserName =
  //     await userRepository.getUsersTop10ByUserName();

  // print('All Users:');
  // users.forEach(print);

  // print('Users with even ID:');
  // for (var e in usersTop10ByUserName) {
  //   print('ID: ${e.id}, Name: ${e.username}');
  // }

  // 과제 6
  // PostRepositoryImpl postRepository = PostRepositoryImpl(baseDataSource);

  // int postId = 5;
  // Post post = await postRepository.getPost(postId);
  // List<Post> posts = await postRepository.getPosts();
  // List<Post> postsPaginated = await postRepository.getPosts(page: 3, limit: 5);

  // print('Post ID $postId:');
  // print(post);

  // print('All Posts:');
  // for (var e in posts) {
  //   print(e.title);
  // }

  // print('Paginated Posts:');
  // for (var e in postsPaginated) {
  //   print('${e.id} - ${e.title}');
  // }
}
