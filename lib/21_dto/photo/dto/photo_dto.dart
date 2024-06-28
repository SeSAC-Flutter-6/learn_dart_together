import 'package:json_annotation/json_annotation.dart';

part 'photo_dto.g.dart';

@JsonSerializable()
class PhotoDto {
  Object? id;
  String? type;
  String? title;
  String? content;
  String? caption;
  String? url;
  String? created_at;

  PhotoDto(this.id, this.type, this.title, this.content, this.caption, this.url,
      this.created_at);

  factory PhotoDto.fromJson(Map<String, dynamic> json) =>
      _$PhotoDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PhotoDtoToJson(this);
}
