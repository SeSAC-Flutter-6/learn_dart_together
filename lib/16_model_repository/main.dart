import 'package:learn_dart_together/16_model_repository/datasource/album_data_source.dart';
import 'package:learn_dart_together/16_model_repository/datasource/comment_data_source.dart';
import 'package:learn_dart_together/16_model_repository/datasource/user_data_source.dart';
import 'package:learn_dart_together/16_model_repository/model/album.dart';
import 'package:learn_dart_together/16_model_repository/repository/album_repository_impl.dart';
import 'package:learn_dart_together/16_model_repository/repository/comment_repository_impl.dart';
import 'package:learn_dart_together/16_model_repository/repository/user_repository_impl.dart';

import 'model/comment.dart';
import 'model/user.dart';

Future<void> main() async {
  // final CommentDataSource commentDataSource = CommentDataSource();
  // final AlbumDataSource albumDataSource = AlbumDataSource();
  // final repository = CommentRepositoryImpl(commentDataSource);
  // final albumRepository = AlbumRepositoryImpl(albumDataSource);

  final userDataSource = UserDataSource();
  final userRepository = UserRepositoryImpl(userDataSource);
  List<User> users = await userRepository.getUsersTop10ByUserName();
  for (var user in users) {
    print('User: ${user.username}');
  }
}
