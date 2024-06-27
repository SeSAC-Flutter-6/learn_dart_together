import 'package:learn_dart_together/18_model_repository/data_source/posts_data_source.dart';
import 'package:learn_dart_together/18_model_repository/model/posts.dart';
import 'package:learn_dart_together/18_model_repository/repository/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  @override
  Future<Post> getPost(int id) async {
    PostApi postApi = PostApi();
    final List<Post> posts = await postApi.getPosts();
    List<Post> idPost = posts.where((e) => id == e.id).toList();
    if (idPost.isNotEmpty) {
      return idPost[0];
    } else {
      throw Exception('Post not found');
    }
  }

  @override
  Future<List<Post>> getPosts() async {
    PostApi postApi = PostApi();
    return postApi.getPosts();
  }

  @override
  Future<List<Post>> getPostsLimit(int page, int limit) async {
    PostApi postApi = PostApi();
    final List<Post> posts = await postApi.getPosts();
    if (page == 0) {
      page = 1;
    }
    int start = ((page - 1) * limit);
    int end = start + limit;
    if (start + limit > posts.length) {
      end = posts.length;
    }
    final List<Post> postsLimit = posts.sublist(start, end);
    return postsLimit;
  }
}
