import 'package:json_annotation/json_annotation.dart';
part 'photo_dto.g.dart';

@JsonSerializable()
class PhotoDto {
  Object? id;
  String? type;
  String? url;
  String? title;
  String? content;
  String? caption;
  String? created_at;

  PhotoDto({
    this.id,
    this.type,
    this.url,
    this.title,
    this.content,
    this.caption,
    this.created_at,
  });

  factory PhotoDto.fromJson(Map<String, dynamic> json) =>
      _$PhotoDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PhotoDtoToJson(this);

  @override
  String toString() =>
      'PhotoDto(id: $id, type: $type, url: $url, title: $title, content: $content, caption: $caption, created_at: $created_at)';
}
