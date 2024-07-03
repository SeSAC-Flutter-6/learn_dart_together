import 'package:json_annotation/json_annotation.dart';

part 'todo_dto.g.dart';

@JsonSerializable()
class TodoDto {
  int? userId;
  int? id;
  String? title;

  @JsonKey(name: 'completed')
  bool? isComplete;

  TodoDto({
    this.userId,
    this.id,
    this.title,
    this.isComplete,
  });

  factory TodoDto.fromJson(Map<String, dynamic> json) =>
      _$TodoDtoFromJson(json);

  Map<String, dynamic> toJson() => _$TodoDtoToJson(this);
}
