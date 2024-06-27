import 'package:learn_dart_together/19_model_repository/data_source/comment_data_source.dart';
import 'package:learn_dart_together/19_model_repository/model/comment.dart';
import 'package:learn_dart_together/19_model_repository/repository/comment_repository.dart';

class CommentRepositoryImpl implements CommentRepository {
  final CommentDataSource _commentDataSource;

  CommentRepositoryImpl(this._commentDataSource);

  @override
  Future<List<Comment>> getComments(int postId) async {
    final data = await _commentDataSource.getData();
    return data.where((e) => e.postId == postId).toList();
  }
}
