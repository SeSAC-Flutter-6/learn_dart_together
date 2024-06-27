import '../data_source/comments.dart';
import '../model/comment.dart';

class CommentRepositoryImpl implements CommentRepository {
  @override
  Future<List<Comment>> getComments(int postId) async {
    final results = await CommentsDataSource().getCommentList();
    final List<Comment> filteredComments =
        results.where((comment) => comment.postId == postId).toList();
    return filteredComments;
  }
}

abstract interface class CommentRepository {
  Future<List<Comment>> getComments(int postId);
}
