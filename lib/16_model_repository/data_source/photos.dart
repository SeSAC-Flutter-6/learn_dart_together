import 'dart:convert';

import 'package:http/http.dart' as http;

class PhotoDataSource {
  Future<List<Photo>> getPhotoList() async {
    final responsePhoto = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
    final List<Photo> commentList = jsonDecode(responsePhoto.body)
            .map<Photo>(
                (json) => Photo.fromJson((json as Map<String, dynamic>)))
            .toList() ??
        [];
    return commentList;
  }
}

class Photo {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

//<editor-fold desc="Data Methods">
  Photo({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Photo &&
          runtimeType == other.runtimeType &&
          albumId == other.albumId &&
          id == other.id &&
          title == other.title &&
          url == other.url &&
          thumbnailUrl == other.thumbnailUrl);

  @override
  int get hashCode =>
      albumId.hashCode ^
      id.hashCode ^
      title.hashCode ^
      url.hashCode ^
      thumbnailUrl.hashCode;

  @override
  String toString() {
    return 'Photo{' +
        ' albumId: $albumId,' +
        ' id: $id,' +
        ' title: $title,' +
        ' url: $url,' +
        ' thumbnailUrl: $thumbnailUrl,' +
        '}';
  }

  Photo copyWith({
    int? albumId,
    int? id,
    String? title,
    String? url,
    String? thumbnailUrl,
  }) {
    return Photo(
      albumId: albumId ?? this.albumId,
      id: id ?? this.id,
      title: title ?? this.title,
      url: url ?? this.url,
      thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'albumId': this.albumId,
      'id': this.id,
      'title': this.title,
      'url': this.url,
      'thumbnailUrl': this.thumbnailUrl,
    };
  }

  factory Photo.fromJson(Map<String, dynamic> map) {
    return Photo(
      albumId: map['albumId'] as int,
      id: map['id'] as int,
      title: map['title'] as String,
      url: map['url'] as String,
      thumbnailUrl: map['thumbnailUrl'] as String,
    );
  }

//</editor-fold>
}
