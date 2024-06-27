import 'package:learn_dart_together/13_model/data/data_source/post_data_source.dart';
import 'package:learn_dart_together/13_model/data/model/post.dart';
import 'package:learn_dart_together/13_model/data/repository/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  final PostDataSource _postDataSource;

  PostRepositoryImpl(this._postDataSource);

  @override
  Future<Post> getPost(int id) async => await _postDataSource.getPost(id);

  @override
  Future<List<Post>> getPosts({int? page, int? limit}) async {
    if (page == null || page < 1) page = 1;
    if (limit == null || limit < 1) {
      return _postDataSource.getPosts();
    }

    final posts = await _postDataSource.getPosts();
    final result = posts.skip((page - 1) * limit).take(limit).toList();

    return result;
  }
}
