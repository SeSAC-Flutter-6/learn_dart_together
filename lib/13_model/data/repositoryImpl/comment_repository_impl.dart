import 'package:learn_dart_together/13_model/data/model/comment.dart';
import 'package:learn_dart_together/13_model/data/repository/comment_repository.dart';

import '../data_source/comment_data_source.dart';

class CommentRepositoryImpl implements CommentRepository {
  final CommentDataSource _commentDataSource;

  CommentRepositoryImpl(this._commentDataSource);

  @override
  Future<List<Comment>> getComments(int postId) =>
      _commentDataSource.getComments();
}
