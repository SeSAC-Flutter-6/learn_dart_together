class Todo {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  Todo(
      {required this.userId,
      required this.id,
      required this.title,
      required this.completed});

  @override
  String toString() {
    return 'Todo{userId=$userId, id=$id, title=$title, completed=$completed}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Todo &&
        other.userId == userId &&
        other.id == id &&
        other.title == title &&
        other.completed == completed;
  }

  @override
  int get hashCode {
    return userId.hashCode ^ id.hashCode ^ title.hashCode ^ completed.hashCode;
  }

  Todo copyWith({int? userId, int? id, String? title, bool? completed}) {
    return Todo(
        userId: userId ?? this.userId,
        id: id ?? this.id,
        title: title ?? this.title,
        completed: completed ?? this.completed);
  }
}
