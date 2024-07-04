import 'package:collection/collection.dart';

class Photo {
  List<String> tags;
  String imageUrl;

  Photo({
    required this.tags,
    required this.imageUrl,
  });

  Photo copyWith({
    List<String>? tags,
    String? imageUrl,
  }) {
    return Photo(
      tags: tags ?? this.tags,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  @override
  String toString() => 'Photo(tags: $tags, imageUrl: $imageUrl)';

  @override
  bool operator ==(covariant Photo other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return listEquals(other.tags, tags) && other.imageUrl == imageUrl;
  }

  @override
  int get hashCode => tags.hashCode ^ imageUrl.hashCode;
}
