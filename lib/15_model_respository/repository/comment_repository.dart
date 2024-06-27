import '../data_source/comment_data_source.dart';
import '../model/comment.dart';

abstract interface class CommentRepository {
  Future<List<Comment>> getComments(int postId);
}

class CommentRepositoryImpl implements CommentRepository {
  final _dataSoure = CommentDataSource();

  @override
  Future<List<Comment>> getComments(int postId) async {
    return (await _dataSoure.fetchComments())
        .where((e) => e.postId == postId)
        .toList();
  }
}
