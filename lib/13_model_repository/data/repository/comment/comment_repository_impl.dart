import 'package:learn_dart_together/13_model_repository/data/data_source/comment_api.dart';
import 'package:learn_dart_together/13_model_repository/data/model/comment.dart';
import 'package:learn_dart_together/13_model_repository/data/repository/comment/comment_repository.dart';

class CommentRepositoryImpl implements CommentRepository {
  final _commentApi = CommentApi();

  @override
  Future<List<Comment>> getCommentsByPostId(int postId) async {
    try {
      final List<dynamic> commentDataList =
          await _commentApi.fetchDataByPostId(postId);
      return commentDataList
          .map<Comment>((json) => Comment.fromJson(json))
          .toList();
    } catch (e) {
      throw Exception('Failed to getCommentsByPostId for post ID $postId: $e');
    }
  }

  @override
  Future<List<Comment>> getComments() async {
    try {
      final List<dynamic> commentDataList = await _commentApi.fetchAllData();
      return commentDataList
          .map<Comment>((json) => Comment.fromJson(json))
          .toList();
    } catch (e) {
      throw Exception('Failed to getComments: $e');
    }
  }
}
