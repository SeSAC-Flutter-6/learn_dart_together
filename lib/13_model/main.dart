import 'package:learn_dart_together/13_model/data/data_source/album_data_source.dart';
import 'package:learn_dart_together/13_model/data/data_source/photo_data_source.dart';
import 'package:learn_dart_together/13_model/data/data_source/post_data_source.dart';
import 'package:learn_dart_together/13_model/data/data_source/todos_data_source.dart';
import 'package:learn_dart_together/13_model/data/repositoryImpl/album_repository_impl.dart';
import 'package:learn_dart_together/13_model/data/repositoryImpl/photo_repository_impl.dart';
import 'package:learn_dart_together/13_model/data/repositoryImpl/post_repository_impl.dart';
import 'package:learn_dart_together/13_model/data/repositoryImpl/todos_repository_impl.dart';
import 'package:learn_dart_together/13_model/data/repositoryImpl/user_repository_impl.dart';

import 'data/data_source/comment_data_source.dart';
import 'data/data_source/user_data_source.dart';
import 'data/repositoryImpl/comment_repository_impl.dart';

Future<void> main() async {
  final commentDataSource = CommentDataSource();
  final commentRepository = CommentrepositoryImpl(commentDataSource);
  final getComment = commentRepository.getComments(1);
  // print(await getComment);

  final albumDataSource = AlbumDataSource();
  final albumRepository = Albumrepositoryimpl(albumDataSource);
  final getAlbums = albumRepository.getAlbums();
  final getalbumsTop10 = albumRepository.getAlbumsTop10();
  // print(await getAlbums);
  // print(await getalbumsTop10);

  final photoDataSource = PhotoDataSource();
  final photoRepository = PhotoRepositoryImpl(photoDataSource);
  final getPhoto = photoRepository.getPhotos(1);
  // print(await getPhoto);

  final todoDataSource = TodosDataSource();
  final todoRepository = TodosRepositoryImpl(todoDataSource);
  final getTodo = todoRepository.getTodos();
  final getTodoComplete = todoRepository.getCompletedTodos();
  // print(await getTodo);
  // print(await getTodoComplete);

  final userDataSource = UserDataSource();
  final userRepository = UserRepositoryImpl(userDataSource);
  final getUser = userRepository.getUsers();
  final getUserTop10 = userRepository.getUsersTop10ByUserName();

  // print(await getUser);
  // print(await getUserTop10);

  final postDataSource = PostDataSource();
  final postRepository = PostRepositoryImpl(postDataSource);
  final getPost = postRepository.getPost(1);
  // print(await getPost);
  final getPosts = postRepository.getPosts();
  // print(await getPosts);
  final pagePosts = postRepository.getPosts(limit: 3);
  // print(await pagePosts);

}
