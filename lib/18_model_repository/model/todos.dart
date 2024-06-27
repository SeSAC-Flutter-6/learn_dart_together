class Todos {
  final String userId;
  final String id;
  final String title;
  final String completed;

  const Todos(
      {required this.userId,
      required this.id,
      required this.title,
      required this.completed});

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Todos &&
        other.userId == userId &&
        other.id == id &&
        other.title == title &&
        other.completed == completed;
  }

  @override
  int get hashCode {
    return userId.hashCode ^ id.hashCode ^ title.hashCode ^ completed.hashCode;
  }

  @override
  String toString() {
    return 'Todos(userId: $userId, id: $id, title: $title, completed: $completed)';
  }

  Todos copyWith(
      {String? userId, String? id, String? title, String? completed}) {
    return Todos(
        userId: userId ?? this.userId,
        id: id ?? this.id,
        title: title ?? this.title,
        completed: completed ?? this.completed);
  }

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'id': id,
        'title': title,
        'completed': completed,
      };

  factory Todos.fromJson(Map<String, dynamic> json) {
    return Todos(
      userId: json['userId'].toString(),
      id: json['id'].toString(),
      title: json['title'].toString(),
      completed: json['completed'] as String,
    );
  }
}
