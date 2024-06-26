class Memo {
  int id;
  String content;

  Memo({
    required this.id,
    required this.content,
  });

  @override
  String toString() => 'Memo(id: $id, content: $content)';

  Memo copyWith({
    int? id,
    String? content,
  }) {
    return Memo(
      id: id ?? this.id,
      content: content ?? this.content,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'content': content,
    };
  }

  factory Memo.fromJson(Map<String, dynamic> map) {
    return Memo(
      id: map['id'] as int,
      content: map['content'] as String,
    );
  }

  @override
  bool operator ==(covariant Memo other) {
    if (identical(this, other)) return true;

    return other.id == id && other.content == content;
  }

  @override
  int get hashCode => id.hashCode ^ content.hashCode;
}
