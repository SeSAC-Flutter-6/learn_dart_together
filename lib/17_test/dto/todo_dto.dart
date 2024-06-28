import 'package:json_annotation/json_annotation.dart';

part 'todo_dto.g.dart';

@JsonSerializable()
class TodoDto {
  int? userId;
  int? id;
  String? title;
  bool? completed;

  TodoDto({
    this.userId,
    this.id,
    this.title,
    this.completed,
  });

  factory TodoDto.fromJson(Map<String, dynamic> json) =>
      _$TodoDtoFromJson(json);

  Map<String, dynamic> toJson() => _$TodoDtoToJson(this);
}
