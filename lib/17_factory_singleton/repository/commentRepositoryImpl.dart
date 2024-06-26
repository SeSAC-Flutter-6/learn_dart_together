import 'package:http/http.dart' as http;
import 'package:learn_dart_together/17_factory_singleton/model/comment_model.dart';
import 'package:learn_dart_together/17_factory_singleton/repository/commentRepository.dart';
import 'package:learn_dart_together/data_source/data_source.dart';
//메뉴판
class CommentRepositoryImpl implements CommentRepository {
  final CommentDataSource commentDataSource;

  CommentRepositoryImpl(this.commentDataSource);

  @override
  Future<List<Comment>> getComments(int postId) => commentDataSource.getCommentsPostId(postId);
