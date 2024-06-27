import 'package:learn_dart_together/19_model_repository/model/comment.dart';

abstract interface class CommentRepository {
  Future<List<Comment>> getComments(int postId);
}