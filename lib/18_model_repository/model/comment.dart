class Comment {
  final String postId;
  final String id;
  final String name;
  final String email;
  final String body;

  const Comment(this.postId, this.id, this.name, this.email, this.body);

  @override
  String toString() {
    return 'Comment{postId=$postId, id=$id, name=$name, email=$email, body=$body}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Comment &&
        other.postId == postId &&
        other.id == id &&
        other.name == name &&
        other.email == email &&
        other.body == body;
  }

  @override
  int get hashCode {
    return postId.hashCode ^
        id.hashCode ^
        name.hashCode ^
        email.hashCode ^
        body.hashCode;
  }

  Comment copyWith({
    String? postId,
    String? id,
    String? name,
    String? email,
    String? body,
  }) {
    return Comment(
      postId ?? this.postId,
      id ?? this.id,
      name ?? this.name,
      email ?? this.email,
      body ?? this.body,
    );
  }

  Map<String, dynamic> toJson() => {
        'postId': postId,
        'id': id,
        'name': name,
        'email': email,
        'body': body,
      };

  Comment.fromJson(Map<String, dynamic> json)
      : postId = json['postId'].toString(),
        id = json['id'].toString(),
        name = json['name'].toString(),
        email = json['email'].toString(),
        body = json['body'].toString();
}
