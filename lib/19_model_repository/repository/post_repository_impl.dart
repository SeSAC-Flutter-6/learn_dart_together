import 'dart:math';

import 'package:learn_dart_together/19_model_repository/data_source/post_data_source.dart';
import 'package:learn_dart_together/19_model_repository/model/post.dart';
import 'package:learn_dart_together/19_model_repository/repository/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  final PostDataSource _postDataSource;

  PostRepositoryImpl(this._postDataSource);

  @override
  Future<Post> getPost(int id) async {
    final data = await _postDataSource.getData();
    return data.firstWhere((e) => e.id == id);
  }

  @override
  Future<List<Post>> getPosts(int page, int limit) async {
    final data = await _postDataSource.getData();
    final pageNum = max(page, 1);
    final startIndex = (pageNum - 1) * limit;
    return data.skip(startIndex).take(limit).toList();
  }
}

void main() async {
  print(await PostRepositoryImpl(PostDataSource()).getPosts(1, 5));
}
