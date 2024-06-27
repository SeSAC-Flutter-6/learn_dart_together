import 'dart:math';
import 'package:learn_dart_together/15_model_respository/data_source/post_data_source.dart';
import '../model/post.dart';

abstract interface class PostRepository {
  Future<Post> getPost(int id);
  Future<List<Post>> getPosts({int page = 1, int? limit});
}

class PostRepositoryImpl extends PostRepository {
  final _dataSource = PostDataSource();

  @override
  Future<List<Post>> getPosts({int page = 1, int? limit}) async {
    final posts = await _dataSource.fetchPosts();
    page = max(page, 1);

    if (limit == null) {
      return page == 1 ? posts : [];
    }

    final start = (page - 1) * limit;
    final end = min(page * limit, posts.length);
    return start < posts.length ? posts.sublist(start, end) : [];
  }

  @override
  Future<Post> getPost(int id) async {
    return (await getPosts()).firstWhere((e) => e.id == id);
  }
}
