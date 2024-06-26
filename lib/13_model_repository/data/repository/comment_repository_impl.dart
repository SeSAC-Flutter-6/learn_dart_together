import 'package:learn_dart_together/13_model_repository/data/data_source/comment_api.dart';
import 'package:learn_dart_together/13_model_repository/data/model/comment.dart';
import 'package:learn_dart_together/13_model_repository/data/repository/comment_repository.dart';

class CommentRepositoryImpl implements CommentRepository {
  final _commentApi = CommentApi();

  @override
  Future<List<Comment>> getCommentsByPostId(int postId) async {
    try {
      final List<dynamic> commentDataLits =
          await _commentApi.fetchDataByPostId(postId);
      return commentDataLits
          .map<Comment>((json) => Comment.fromJson(json))
          .toList();
    } catch (e) {
      throw Exception('Failed to fetch comments for post ID $postId: $e');
    }
  }

  @override
  Future<List<Comment>> getComments() async {
    try {
      final List<dynamic> commentDataLits = await _commentApi.fetchAllData();
      return commentDataLits
          .map<Comment>((json) => Comment.fromJson(json))
          .toList();
    } catch (e) {
      throw Exception('Failed to fetch comments: $e');
    }
  }
}
