import 'dart:convert';

import 'package:http/http.dart' as http;

class CommentsDataSource {
  Future<List<Comment>> getCommentList() async {
    final responseComment = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/comments'));
    final List<Comment> commentList = jsonDecode(responseComment.body)
            .map<Comment>(
                (json) => Comment.fromJson((json as Map<String, dynamic>)))
            .toList() ??
        [];
    return commentList;
  }
}

class Comment {
  int postId;
  int id;
  String name;
  String email;
  String body;

//<editor-fold desc="Data Methods">

  Comment({
    required this.postId,
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Comment &&
          runtimeType == other.runtimeType &&
          postId == other.postId &&
          id == other.id &&
          name == other.name &&
          email == other.email &&
          body == other.body);

  @override
  int get hashCode =>
      postId.hashCode ^
      id.hashCode ^
      name.hashCode ^
      email.hashCode ^
      body.hashCode;

  @override
  String toString() {
    return 'Comment{' +
        ' postId: $postId,' +
        ' id: $id,' +
        ' name: $name,' +
        ' email: $email,' +
        ' body: $body,' +
        '}';
  }

  Comment copyWith({
    int? postId,
    int? id,
    String? name,
    String? email,
    String? body,
  }) {
    return Comment(
      postId: postId ?? this.postId,
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      body: body ?? this.body,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'postId': this.postId,
      'id': this.id,
      'name': this.name,
      'email': this.email,
      'body': this.body,
    };
  }

  factory Comment.fromJson(Map<String, dynamic> map) {
    return Comment(
      postId: map['postId'] as int,
      id: map['id'] as int,
      name: map['name'] as String,
      email: map['email'] as String,
      body: map['body'] as String,
    );
  }

//</editor-fold>
}
