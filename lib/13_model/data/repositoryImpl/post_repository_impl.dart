import 'package:learn_dart_together/13_model/data/data_source/post_data_source.dart';
import 'package:learn_dart_together/13_model/data/model/post.dart';
import 'package:learn_dart_together/13_model/data/repository/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  final PostDataSource _postDataSource;

  PostRepositoryImpl(this._postDataSource);

  @override
  Future<Post> getPost(int id) => _postDataSource.getPost(id);

  @override
  Future<List<Post>> getPosts({int? page, int? limit}) =>
      _postDataSource.getPosts(page: page, limit: limit);
}
