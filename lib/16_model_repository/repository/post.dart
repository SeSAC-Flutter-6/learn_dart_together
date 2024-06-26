import '../data_source/posts.dart';

class PostRepositoryImpl implements PostRepository {
  @override
  Future<Post> getPost(int id) async {
    final results = await PostDataSource().getPostList();
    final List<Post> filteredPosts =
        results.where((post) => post.id == id).toList();
    return filteredPosts[0];
  }

  @override
  Future<List<Post>> getPosts({int? page, int? limit}) async {
    final results = await PostDataSource().getPostList();

    int pageNumber = page ?? 1;
    final int limitNumber = limit ?? results.length;

    pageNumber = pageNumber < 1 ? 1 : pageNumber;

    List<Post> filteredPosts = [];
    if (limitNumber > 0 && limitNumber <= results.length) {
      filteredPosts = results
          .skip((pageNumber - 1) * limitNumber)
          .take(limitNumber)
          .toList();
    }

    return filteredPosts;
  }
}

abstract interface class PostRepository {
  Future<Post> getPost(int id);

  Future<List<Post>> getPosts({int page, int limit});
}
