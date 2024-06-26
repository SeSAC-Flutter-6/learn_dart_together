import 'package:learn_dart_together/18_model_repository/model/posts.dart';

abstract interface class PostRepository {
  Future<Post> getPost(int id);
  Future<List<Post>> getPosts();
  Future<List<Post>> getPostsLimit(int page, int limit);
}
