class Memo {
  final String content;
  final int id;

//<editor-fold desc="Data Methods">
  Memo({
    required this.content,
    required this.id,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Memo &&
          runtimeType == other.runtimeType &&
          content == other.content &&
          id == other.id);

  @override
  int get hashCode => content.hashCode ^ id.hashCode;

  @override
  String toString() {
    return 'Memo{content: $content, id: $id}';
  }

  Memo copyWith({
    String? content,
    int? id,
  }) {
    return Memo(
      content: content ?? this.content,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'content': content,
      'id': id,
    };
  }

  factory Memo.fromJson(Map<String, dynamic> map) {
    return Memo(
      content: map['content'] as String,
      id: map['id'] as int,
    );
  }

//</editor-fold>
}
