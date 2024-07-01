class Media {
  final int id;
  final Type type;
  final String caption;
  final String content;
  final String url;
  final DateTime createdAt;

//<editor-fold desc="Data Methods">
  const Media({
    required this.id,
    required this.type,
    required this.caption,
    required this.content,
    required this.url,
    required this.createdAt,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Media &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          type == other.type &&
          caption == other.caption &&
          content == other.content &&
          url == other.url &&
          createdAt == other.createdAt);

  @override
  int get hashCode =>
      id.hashCode ^
      type.hashCode ^
      caption.hashCode ^
      content.hashCode ^
      url.hashCode ^
      createdAt.hashCode;

  @override
  String toString() {
    return 'Media{' +
        ' id: $id,' +
        ' type: $type,' +
        ' caption: $caption,' +
        ' content: $content,' +
        ' url: $url,' +
        ' createdAt: $createdAt,' +
        '}';
  }

  Media copyWith({
    int? id,
    Type? type,
    String? caption,
    String? content,
    String? url,
    DateTime? createdAt,
  }) {
    return Media(
      id: id ?? this.id,
      type: type ?? this.type,
      caption: caption ?? this.caption,
      content: content ?? this.content,
      url: url ?? this.url,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'type': this.type,
      'caption': this.caption,
      'content': this.content,
      'url': this.url,
      'createdAt': this.createdAt,
    };
  }

  factory Media.fromMap(Map<String, dynamic> map) {
    return Media(
      id: map['id'] as int,
      type: map['type'] as Type,
      caption: map['caption'] as String,
      content: map['content'] as String,
      url: map['url'] as String,
      createdAt: map['createdAt'] as DateTime,
    );
  }

//</editor-fold>
}

enum Type { article, image, video, unknown }
