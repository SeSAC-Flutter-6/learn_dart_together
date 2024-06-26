class Comment {
  final int postId;
  final String id;
  final String name;
  final String email;
  final String body;

  const Comment({
    required this.postId,
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is Comment &&
            runtimeType == other.runtimeType &&
            postId == other.postId &&
            id == other.id &&
            name == other.name &&
            email == other.email &&
            body == other.body;
  }

  @override
  int get hashCode =>
      postId.hashCode ^
      id.hashCode ^
      name.hashCode ^
      email.hashCode ^
      body.hashCode;

  @override
  String toString() {
    return 'CommentModel{postId: $postId, id: $id, name: $name, email: $email, body: $body)}';
  }

  Comment copyWith({
    int? postId,
    String? id,
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

  Map<String, dynamic> toJson() => {
        'postId': postId,
        'id': id,
        'name': name,
        'email': email,
        'body': body,
      };

  Comment.fromJson(Map<String, dynamic> json)
      : postId = json['postId'],
        id = json['id'],
        name = json['name'],
        email = json['email'],
        body = json['body'];
}
