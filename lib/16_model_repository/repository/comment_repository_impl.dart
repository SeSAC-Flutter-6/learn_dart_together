import './comment_repository.dart';
import '../model/comment.dart';
import 'package:learn_dart_together/data_source/base_data_source.dart';

class CommentRepositoryImpl implements CommentRepository {
  final BaseDataSource _baseDataSource;

  CommentRepositoryImpl(this._baseDataSource);

  @override
  Future<List<Comment>> getAllComments() async {
    return _baseDataSource.fetchData<Comment>(
      'https://jsonplaceholder.typicode.com/comments',
      (json) => Comment.fromJson(json),
    );
  }

  @override
  Future<List<Comment>> getComments(int postId) async {
    List<Comment> allComments = await getAllComments();
    return allComments.where((comment) => comment.postId == postId).toList();
  }
}
