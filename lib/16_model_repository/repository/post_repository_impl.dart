import 'package:learn_dart_together/16_model_repository/datasource/post_data_source.dart';
import 'package:learn_dart_together/16_model_repository/model/post.dart';
import 'package:learn_dart_together/16_model_repository/repository/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  final PostDataSource _postDataSource;

  PostRepositoryImpl(this._postDataSource);

  @override
  Future<Post> getPost(int id) => _postDataSource.getPost(id);

  @override
  Future<List<Post>> getPosts({int? page, int? limit}) async {
    var posts = await _postDataSource.getPosts();
    if (page != null && limit != null) {
      int currentPage = page < 1 ? 1 : page;
      int currentLimit = limit;

      int startIndex = currentPage * currentLimit;
      int endIndex = startIndex + currentLimit;

      if (startIndex >= posts.length) {
        return [];
      }

      endIndex = endIndex > posts.length ? posts.length : endIndex;

      return posts.sublist(startIndex, endIndex);
    } else {
      return posts;
    }
  }
}

Future<void> main() async {
  final postDataSource = PostDataSource();
  final repository = PostRepositoryImpl(postDataSource);
  final post = await repository.getPost(1);
  final List<Post> posts = await repository.getPosts(limit: 3, page: 3);

  print(post);
  print(posts);
}
