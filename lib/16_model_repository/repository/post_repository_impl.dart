import './post_repository.dart';
import '../model/post.dart';
import 'package:learn_dart_together/data_source/base_data_source.dart';

class PostRepositoryImpl implements PostRepository {
  final BaseDataSource _baseDataSource;

  PostRepositoryImpl(this._baseDataSource);

  @override
  Future<Post> getPost(int id) async {
    return _baseDataSource.fetchDataSingle(
        'https://jsonplaceholder.typicode.com/posts',
        (json) => Post.fromJson(json),
        id);
  }

  @override
  Future<List<Post>> getPosts({
    int? page,
    int? limit,
  }) async {
    if (page != null && limit != null) {
      // return _baseDataSource.fetchData(
      //   'https://jsonplaceholder.typicode.com/posts?_page=$page&_limit=$limit',
      //   (json) => Post.fromJson(json),
      // );

      List<Post> posts = [];
      for (int i = page * limit - limit; i <= page * limit; i++) {
        posts.add(await getPost(i));
      }
      return posts;
    }
    return _baseDataSource.fetchData(
      'https://jsonplaceholder.typicode.com/posts',
      (json) => Post.fromJson(json),
    );
  }
}
