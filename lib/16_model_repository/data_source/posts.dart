import 'dart:convert';

import 'package:http/http.dart' as http;

class PostDataSource {
  Future<List<Post>> getPostList() async {
    final responsePost =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    final List<Post> postList = jsonDecode(responsePost.body)
            .map<Post>((json) => Post.fromJson(json as Map<String, dynamic>))
            .toList() ??
        [];
    return postList;
  }
}

class Post {
  int userId;
  int id;
  String title;
  String body;

//<editor-fold desc="Data Methods">
  Post({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Post &&
          runtimeType == other.runtimeType &&
          userId == other.userId &&
          id == other.id &&
          title == other.title &&
          body == other.body);

  @override
  int get hashCode =>
      userId.hashCode ^ id.hashCode ^ title.hashCode ^ body.hashCode;

  @override
  String toString() {
    return 'Post{' +
        ' userId: $userId,' +
        ' id: $id,' +
        ' title: $title,' +
        ' body: $body,' +
        '}';
  }

  Post copyWith({
    int? userId,
    int? id,
    String? title,
    String? body,
  }) {
    return Post(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': this.userId,
      'id': this.id,
      'title': this.title,
      'body': this.body,
    };
  }

  factory Post.fromJson(Map<String, dynamic> map) {
    return Post(
      userId: map['userId'] as int,
      id: map['id'] as int,
      title: map['title'] as String,
      body: map['body'] as String,
    );
  }

//</editor-fold>
}
