enum Type {
  article,
  image,
  video,
  unknown,
}

class Photo {
  final int id;
  final Type type;
  final String title;
  final String content;
  final String caption;
  final String url;
  final DateTime createdAt;

//<editor-fold desc="Data Methods">
  const Photo({
    required this.id,
    required this.type,
    required this.title,
    required this.content,
    required this.caption,
    required this.url,
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
          caption == other.caption &&
          url == other.url &&
          createdAt == other.createdAt);

  @override
  int get hashCode =>
      id.hashCode ^
      type.hashCode ^
      title.hashCode ^
      content.hashCode ^
      caption.hashCode ^
      url.hashCode ^
      createdAt.hashCode;

  @override
  String toString() {
    return 'Photo{ id: $id, type: $type, title: $title, content: $content, caption: $caption, url: $url, createdAt: $createdAt,}';
  }

  Photo copyWith({
    int? id,
    Type? type,
    String? title,
    String? content,
    String? caption,
    String? url,
    DateTime? createdAt,
  }) {
    return Photo(
      id: id ?? this.id,
      type: type ?? this.type,
      title: title ?? this.title,
      content: content ?? this.content,
      caption: caption ?? this.caption,
      url: url ?? this.url,
      createdAt: createdAt ?? this.createdAt,
    );
  }

//</editor-fold>
}
