import 'package:learn_dart_together/12_data_source/data_source/comment_data_source.dart';
import 'package:learn_dart_together/12_data_source/model/comment.dart';

abstract interface class CommentRepository {
  Future<List<Comment>> getAllComments(int postId);
}

final class CommentRepositoryImpl implements CommentRepository {
  final CommentDataSource _commentDataSource;

  CommentRepositoryImpl(this._commentDataSource);

  @override
  Future<List<Comment>> getAllComments(int postId) => _commentDataSource.getComments(postId);
}