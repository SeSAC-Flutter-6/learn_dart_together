import '../model/comment.dart';

abstract interface class Commentrepository {
  Future<List<Comment>> getComments(int postId);
}
