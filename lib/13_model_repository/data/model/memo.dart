class Memo {
  int id;
  String content;
  Memo({
    required this.id,
    required this.content,
  });

  Memo copyWith({
    int? id,
    String? content,
  }) {
    return Memo(
      id: id ?? this.id,
      content: content ?? this.content,
    );
  }

  factory Memo.fromJson(Map<String, dynamic> json) {
    return Memo(
      id: json['id'],
      content: json['content'],
    );
  }

  @override
  String toString() => 'Memo(id: $id, content: $content)';

  @override
  bool operator ==(covariant Memo other) {
    if (identical(this, other)) return true;

    return other.id == id && other.content == content;
  }

  @override
  int get hashCode => id.hashCode ^ content.hashCode;
}
