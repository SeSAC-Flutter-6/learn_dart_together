class Todo {
  int userId;
  int id;
  String title;
  bool completed;

  Todo({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  Todo.fromJson(Map<String, dynamic> json)
      : userId = json['userId'],
        id = json['id'],
        title = json['title'],
        completed = json['completed'];

  Map<String, dynamic> toJson() =>
      {'userId': userId, 'id': id, 'title': title, 'completed': completed};

  @override
  int get hashCode => Object.hash(userId, id, title, completed);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Todo &&
          runtimeType == other.runtimeType &&
          userId == other.userId &&
          title == other.title &&
          completed == other.completed;

  @override
  String toString() =>
    'Todo${this.toJson()}';

  Todo copyWith(int? userId, int? id, String? title, bool? completed) =>
    Todo(userId: userId ?? this.userId, id: id ?? this.id, title: title ?? this.title, completed: completed ?? this.completed);
}