import 'package:learn_dart_together/17_factory_singleton/model/comment_model.dart';

abstract interface class CommentRepository {
  //CRUD
  //메뉴판

  Future<List<Comment>> getComments(int postId);
}