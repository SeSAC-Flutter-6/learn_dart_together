class TodoDto {
  int? userId;
  int? id;
  String? title;
  bool? completed;

  TodoDto({this.userId, this.id, this.title, this.completed});

  factory TodoDto.fromJson(Map<String, dynamic> json) => TodoDto(
        userId: json['userId'] as int?,
        id: json['id'] as int?,
        title: json['title'] as String?,
        completed: json['completed'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'id': id,
        'title': title,
        'completed': completed,
      };
}
