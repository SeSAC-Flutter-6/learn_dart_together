class Photo {
  final int id;
  final PhotoType type;
  final DateTime createdAt;
  final String url;
  Photo({
    required this.id,
    required this.type,
    required this.createdAt,
    required this.url,
  });

  Photo copyWith({
    int? id,
    PhotoType? type,
    DateTime? createdAt,
    String? url,
  }) {
    return Photo(
      id: id ?? this.id,
      type: type ?? this.type,
      createdAt: createdAt ?? this.createdAt,
      url: url ?? this.url,
    );
  }

  @override
  String toString() =>
      'Photo(id: $id, type:$type createdAt: $createdAt, url: $url)';

  @override
  bool operator ==(covariant Photo other) {
    if (identical(this, other)) return true;

    return other.id == id && other.url == url;
  }

  @override
  int get hashCode => id.hashCode ^ url.hashCode;
}

enum PhotoType {
  article,
  image,
  video,
  unknown,
}
