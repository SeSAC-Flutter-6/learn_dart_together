import 'package:learn_dart_together/13_model_repository/data/data_source/post_api.dart';
import 'package:learn_dart_together/13_model_repository/data/model/post.dart';
import 'package:learn_dart_together/13_model_repository/data/repository/post/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  final _postApi = PostApi();

  @override
  Future<Post> getPostById(int id) async {
    try {
      final postData = await _postApi.fetchDataById(id);
      return Post.fromJson(postData);
    } catch (e) {
      throw Exception('Failed to getPostById for ID $id: $e');
    }
  }

  @override
  Future<List<Post>> getPosts({int? page, int? limit}) async {
    try {
      if (page != null && limit != null) {
        // 페이지네이션 적용
        final List<dynamic> postDataList = await _postApi.fetchAllData();

        int pageIndex = page <= 1 ? 1 : page;
        int startIndex = (pageIndex - 1) * limit;
        int endIndex = startIndex + limit;

        // startIndex를 0 이상으로 보정
        startIndex = startIndex.clamp(0, postDataList.length);

        // endIndex를 startIndex 이상, postDataList.length 이하로 보정
        endIndex = endIndex.clamp(startIndex, postDataList.length);

        if (startIndex >= postDataList.length) {
          return [];
        }

        return postDataList
            .sublist(startIndex, endIndex)
            .map<Post>((json) => Post.fromJson(json))
            .toList();
      } else {
        // 모든 게시물 가져오기
        final List<dynamic> postDataList = await _postApi.fetchAllData();
        return postDataList.map<Post>((json) => Post.fromJson(json)).toList();
      }
    } catch (e) {
      throw Exception('Failed to getPosts : $e');
    }
  }
}
