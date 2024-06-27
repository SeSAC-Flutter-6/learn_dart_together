class Album {
  final String userId;
  final String id;
  final String title;

  const Album({required this.userId, required this.id, required this.title});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Album &&
        other.userId == userId &&
        other.id == id &&
        other.title == title;
  }

  @override
  int get hashCode => userId.hashCode ^ id.hashCode ^ title.hashCode;

  @override
  String toString() => 'Album(userId: $userId, id: $id, title: $title)';
  Album copyWith({String? userId, String? id, String? title}) {
    return Album(
        userId: userId ?? this.userId,
        id: id ?? this.id,
        title: title ?? this.title);
  }

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'id': id,
        'title': title,
      };

  Album.fromJson(Map<String, dynamic> json)
      : userId = json['userId'].toString(),
        id = json['id'].toString(),
        title = json['title'].toString();
}
