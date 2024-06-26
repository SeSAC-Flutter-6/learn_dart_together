import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Memo {
  final String id;
  final String content;

  Memo({required this.id, required this.content});

  @override
  String toString() => 'Memo(id: $id, content: $content)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Memo && other.id == id && other.content == content;
  }

  @override
  int get hashCode => id.hashCode ^ content.hashCode;
  Memo copyWith({String? id, String? content}) {
    return Memo(id: id ?? this.id, content: content ?? this.content);
  }
}
