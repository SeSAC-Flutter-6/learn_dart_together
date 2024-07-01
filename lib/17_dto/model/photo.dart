enum Type {
  article,
  image,
  video,
  unknown,
}

class Photo {
  int id;
  Type type;
  String url;
  String title;
  String content;
  String caption;
  DateTime? createdAt;

  Photo({
    required this.id,
    required this.type,
    required this.url,
    required this.title,
    required this.content,
    required this.caption,
    required this.createdAt,
  });

  Photo copyWith({
    int? id,
    Type? type,
    String? url,
    String? title,
    String? content,
    String? caption,
    DateTime? createdAt,
  }) {
    return Photo(
      id: id ?? this.id,
      type: type ?? this.type,
      url: url ?? this.url,
      title: title ?? this.title,
      content: content ?? this.content,
      caption: caption ?? this.caption,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  String toString() {
    return 'Photo(id: $id, type: $type, url: $url, title: $title, content: $content, caption: $caption, createdAt: $createdAt)';
  }

  @override
  bool operator ==(covariant Photo other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.type == type &&
        other.url == url &&
        other.title == title &&
        other.content == content &&
        other.caption == caption &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        type.hashCode ^
        url.hashCode ^
        title.hashCode ^
        content.hashCode ^
        caption.hashCode ^
        createdAt.hashCode;
  }
}
