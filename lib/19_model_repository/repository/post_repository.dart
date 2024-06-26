import 'package:learn_dart_together/19_model_repository/model/post.dart';

abstract interface class PostRepository {
  Future<Post> getPost(int id);

  Future<List<Post>> getPosts(int page, int limit);
}
