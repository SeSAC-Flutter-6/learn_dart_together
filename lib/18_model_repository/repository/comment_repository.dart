import 'package:learn_dart_together/18_model_repository/model/comment.dart';

abstract interface class CommentsRepository {
  Future<List<Comment>> getComments(int postId);
}
