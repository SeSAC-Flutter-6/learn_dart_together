import 'package:json_annotation/json_annotation.dart';
part 'photo_dto.g.dart';

@JsonSerializable()
class PhotoDto {
  dynamic id;
  String? type;
  String? url;
  String? title;
  String? content;
  String? caption;
  @JsonKey(name: 'created_at')
  String? createdAt;

  PhotoDto({
    this.id,
    this.type,
    this.url,
    this.title,
    this.content,
    this.caption,
    this.createdAt,
  });

  factory PhotoDto.fromJson(Map<String, dynamic> json) =>
      _$PhotoDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PhotoDtoToJson(this);
}
