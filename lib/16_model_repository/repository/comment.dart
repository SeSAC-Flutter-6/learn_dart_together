import '../data_source/comments.dart';

class CommentRepositoryImpl implements CommentRepository {
  @override
  Future<List<Comment>> getComments(int postId) async {
    final results = await CommentsDataSource().getCommentList();
    List<Comment> filteredComments =
        results.where((comment) => comment.postId == postId).toList();
    return filteredComments;
  }
}

abstract interface class CommentRepository {
  Future<List<Comment>> getComments(int postId);
}
