import '../model/comment.dart';

abstract interface class CommentRepository {
  Future<List<Comment>> getAllComments();
  Future<List<Comment>> getComments(int postId);
}
