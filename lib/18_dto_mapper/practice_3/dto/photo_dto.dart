// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'photo_dto.g.dart';

@JsonSerializable()
class PhotoDto {
  final Object? id; // non-nullable을 고민했으나 id가 빠져있는 경우도 있을 수도..?
  final String? type;
  final String? title;
  final String? content;
  final String? url;
  final String? caption;
  @JsonKey(name: 'created_at')
  final String?
      createdAt; // Datatime type으로 받으려 했으나 일단 무지성으로 string으로 받고, mapper에서 parsing하는게 맞는지?

  PhotoDto({
    this.id,
    this.type,
    this.title,
    this.content,
    this.url,
    this.caption,
    this.createdAt,
  });

  factory PhotoDto.fromJson(Map<String, dynamic> json) =>
      _$PhotoDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PhotoDtoToJson(this);
}
