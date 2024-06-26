import 'package:learn_dart_together/18_model_repository/data_source/comment_data_source.dart';
import 'package:learn_dart_together/18_model_repository/model/comment.dart';
import 'package:learn_dart_together/18_model_repository/repository/comment_repository.dart';

class CommentsRepositoryImpl implements CommentsRepository {
  @override
  Future<List<Comment>> getComments(int postId) async {
    CommentsApi commentsApi = CommentsApi();
    final List<Comment> comments = await commentsApi.getComments();
    List<Comment> postIdComments =
        comments.where((e) => postId.toString() == e.postId).toList();

    return postIdComments;
  }
}
