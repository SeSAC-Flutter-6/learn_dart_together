class Photo {
  final int id;
  final Type type;
  final String title;
  final String content;
  final DateTime createdAt;

//<editor-fold desc="Data Methods">
  Photo({
    required this.id,
    required this.type,
    required this.title,
    required this.content,
    required this.createdAt,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Photo &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          type == other.type &&
          title == other.title &&
          content == other.content &&
          createdAt == other.createdAt);

  @override
  int get hashCode =>
      id.hashCode ^
      type.hashCode ^
      title.hashCode ^
      content.hashCode ^
      createdAt.hashCode;

  @override
  String toString() {
    return 'Photo{ id: $id, type: $type, title: $title, content: $content, createdAt: $createdAt,}';
  }

  Photo copyWith({
    int? id,
    Type? type,
    String? title,
    String? content,
    DateTime? createdAt,
  }) {
    return Photo(
      id: id ?? this.id,
      type: type ?? this.type,
      title: title ?? this.title,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
    );
  }
//</editor-fold>
}

enum Type { article, image, video, unknown }
