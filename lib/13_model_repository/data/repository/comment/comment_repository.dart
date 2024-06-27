import 'package:learn_dart_together/13_model_repository/data/model/comment.dart';

abstract interface class CommentRepository{
  Future<List<Comment>> getCommentsByPostId(int postId);
  Future<List<Comment>> getComments();
}