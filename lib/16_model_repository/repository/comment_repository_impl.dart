import 'package:learn_dart_together/16_model_repository/datasource/comment_data_source.dart';
import 'package:learn_dart_together/16_model_repository/repository/comment_repository.dart';

import '../model/comment.dart';

class CommentRepositoryImpl implements CommentRepository {
  final CommentDataSource _commentDataSource;

  CommentRepositoryImpl(this._commentDataSource);

  @override
  Future<List<Comment>> getComments(int postId) async {
    List<Comment> comments = await _commentDataSource.getComments(postId);
    return comments.where((e) => e.postId == postId).toList();
  }
}
