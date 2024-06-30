enum Type { article, image, video, unknown }

class Photo {
  final int id;
  final Type type;
  final String url;
  final String caption;
  final DateTime createdAt;

  Photo({
    required this.id,
    required this.type,
    required this.url,
    required this.caption,
    required this.createdAt,
  });

  Photo copyWith({
    int? id,
    Type? type,
    String? url,
    String? caption,
    DateTime? createdAt,
  }) {
    return Photo(
      id: id ?? this.id,
      type: type ?? this.type,
      url: url ?? this.url,
      caption: caption ?? this.caption,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  String toString() {
    return 'Photo(id: $id, type: $type, url: $url, caption: $caption, createdAt: $createdAt)';
  }

  @override
  bool operator ==(covariant Photo other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.type == type &&
        other.url == url &&
        other.caption == caption &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        type.hashCode ^
        url.hashCode ^
        caption.hashCode ^
        createdAt.hashCode;
  }
}
