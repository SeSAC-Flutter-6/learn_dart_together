// ignore_for_file: unused_local_variable
import 'package:learn_dart_together/13_model_repository/data/model/album.dart';
import 'package:learn_dart_together/13_model_repository/data/model/comment.dart';
import 'package:learn_dart_together/13_model_repository/data/model/memo.dart';
import 'package:learn_dart_together/13_model_repository/data/model/photo.dart';
import 'package:learn_dart_together/13_model_repository/data/model/post.dart';
import 'package:learn_dart_together/13_model_repository/data/model/todo.dart';
import 'package:learn_dart_together/13_model_repository/data/model/user.dart';
import 'package:learn_dart_together/13_model_repository/data/repository/album/album_repository_impl.dart';
import 'package:learn_dart_together/13_model_repository/data/repository/comment/comment_repository_impl.dart';
import 'package:learn_dart_together/13_model_repository/data/repository/memo/memo_repository_impl.dart';
import 'package:learn_dart_together/13_model_repository/data/repository/photo/photo_repository_impl.dart';
import 'package:learn_dart_together/13_model_repository/data/repository/post/post_repository_impl.dart';
import 'package:learn_dart_together/13_model_repository/data/repository/todo/todo_repository_impl.dart';
import 'package:learn_dart_together/13_model_repository/data/repository/user/user_repository_impl.dart';

Future<void> main() async {
  final commentRepository = CommentRepositoryImpl();
  final albumRepository = AlbumRepositoryImpl();
  final photoRepository = PhotoRepositoryImpl();
  final todoRepository = TodoRepositoryImpl();
  final userRepository = UserRepositoryImpl();
  final postRepository = PostRepositoryImpl();
  final memoRepository = MemoRepositoryImpl();

  //문제 1
  List<Comment> comments = await commentRepository.getCommentsByPostId(1);
  printData(comments);

  //문제 2
  List<Album> albums = await albumRepository.getAlbums();
  printData(albums);
  List<Album> top10Album = await albumRepository.getAlbumsTop10();
  print(top10Album.length == 10);
  printData(top10Album);

  //문제 3
  List<Photo> photos = await photoRepository.getPhotosByAlbumId(1);
  printData(photos);

  //문제 4
  List<Todo> todos = await todoRepository.getTodos();
  printData(todos);
  List<Todo> completedTodos = await todoRepository.getCompletedTodos();
  printData(completedTodos);

  //문제 5
  List<User> users = await userRepository.getUsers();
  printData(users);
  List<User> top10Users = await userRepository.getUsersTop10ByUserName();
  printData(top10Users);

  //문제 6
  Post post1 = await postRepository.getPostById(1);
  print(post1);
  List<Post> allPosts = await postRepository.getPosts();
  printData(allPosts);
  print(allPosts.length); //100
  List<Post> postsPage1 = await postRepository.getPosts(page: 1, limit: 10);
  printData(postsPage1);
  List<Post> postsPage2 = await postRepository.getPosts(page: 2, limit: 10);
  printData(postsPage2);

  //문제 7
  final memo = await memoRepository.createMemo('This is a new memo.');
  final memos = await memoRepository.getAllMemos();
  Memo meno = Memo(id: 1, content: 'content');
  memo.content = 'This is an updated memo. ';
  await memoRepository.updateMemo(memo);
  await memoRepository.deleteMemo(1);
}

void printData<T>(List<T> dataList) {
  for (var data in dataList) {
    print(data);
  }
}
