class Memo {
  int id;
  String content;

//<editor-fold desc="Data Methods">
  Memo({
    required this.id,
    required this.content,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Memo &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          content == other.content);

  @override
  int get hashCode => id.hashCode ^ content.hashCode;

  @override
  String toString() {
    return 'Memo{' + ' id: $id,' + ' content: $content,' + '}';
  }

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
    return {
      'id': this.id,
      'content': this.content,
    };
  }

  factory Memo.fromJson(Map<String, dynamic> map) {
    return Memo(
      id: map['id'] as int,
      content: map['content'] as String,
    );
  }

//</editor-fold>
}
