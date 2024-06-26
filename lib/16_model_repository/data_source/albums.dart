import 'dart:convert';

import 'package:http/http.dart' as http;

class AlbumDataSource {
  Future<List<Album>> getAlbumList() async {
    final responseAlbum = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));
    final List<Album> albumList = jsonDecode(responseAlbum.body)
            .map<Album>((json) => Album.fromJson(json as Map<String, dynamic>))
            .toList() ??
        [];
    return albumList;
  }
}

class Album {
  int userId;
  int id;
  String title;

//<editor-fold desc="Data Methods">

  Album({
    required this.userId,
    required this.id,
    required this.title,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Album &&
          runtimeType == other.runtimeType &&
          userId == other.userId &&
          id == other.id &&
          title == other.title);

  @override
  int get hashCode => userId.hashCode ^ id.hashCode ^ title.hashCode;

  @override
  String toString() {
    return 'Albums{' +
        ' userId: $userId,' +
        ' id: $id,' +
        ' title: $title,' +
        '}';
  }

  Album copyWith({
    int? userId,
    int? id,
    String? title,
  }) {
    return Album(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      title: title ?? this.title,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': this.userId,
      'id': this.id,
      'title': this.title,
    };
  }

  factory Album.fromJson(Map<String, dynamic> map) {
    return Album(
      userId: map['userId'] as int,
      id: map['id'] as int,
      title: map['title'] as String,
    );
  }

//</editor-fold>
}
