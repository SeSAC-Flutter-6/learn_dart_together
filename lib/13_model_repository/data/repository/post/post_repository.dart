import 'package:learn_dart_together/13_model_repository/data/model/post.dart';

abstract interface class PostRepository {
  Future<Post> getPostById(int id);
  Future<List<Post>> getPosts({int? page, int? limit});
}
