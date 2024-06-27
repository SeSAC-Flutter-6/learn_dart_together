import 'dart:math';
import 'package:learn_dart_together/12_data_source/data_source/post_data_source.dart';
import 'package:learn_dart_together/12_data_source/model/post.dart';

abstract interface class PostRepository {
  Future<Post> getPost(int id);
  Future<List<Post>> getPosts();
  Future<List<Post>> getPostsByPage(int page, int limit);
}

final class PostRepositoryImpl implements PostRepository {
  final PostDataSource _postDataSource;

  PostRepositoryImpl(this._postDataSource);

  @override
  Future<Post> getPost(int id) async {
    final posts = await _postDataSource.fetch();
    return posts.firstWhere((e) => e.id == id);
  }

  @override
  Future<List<Post>> getPosts() => _postDataSource.fetch();

  @override
  Future<List<Post>> getPostsByPage(int page, int limit) async {
    final pageIndex = max(1, page);
    final posts = await _postDataSource.fetch();
    final startIndex = page * limit;
    final lastIndex = startIndex + limit;

    // 에러처리 필요 요망..
    return posts.sublist(startIndex, lastIndex);
  }

}