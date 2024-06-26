class Comment {
  final int postId;
  final int id;
  final String name;
  final String body;

//<editor-fold desc="Data Methods">
  const Comment({
    required this.postId,
    required this.id,
    required this.name,
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
          body == other.body);

  @override
  int get hashCode =>
      postId.hashCode ^ id.hashCode ^ name.hashCode ^ body.hashCode;

  @override
  String toString() {
    return 'Person{ postId: $postId, id: $id, name: $name, body: $body,}';
  }

  Comment copyWith({
    int? postId,
    int? id,
    String? name,
    String? body,
  }) {
    return Comment(
      postId: postId ?? this.postId,
      id: id ?? this.id,
      name: name ?? this.name,
      body: body ?? this.body,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'postId': postId,
      'id': id,
      'name': name,
      'body': body,
    };
  }

  factory Comment.fromJson(Map<String, dynamic> map) {
    return Comment(
      postId: map['postId'] as int,
      id: map['id'] as int,
      name: map['name'] as String,
      body: map['body'] as String,
    );
  }

//</editor-fold>
}
