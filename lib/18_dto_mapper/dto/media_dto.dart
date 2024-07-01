import 'package:json_annotation/json_annotation.dart';

part 'media_dto.g.dart';

@JsonSerializable()
class MediaDto {
  int? id;
  String? type;
  String? title;
  String? content;
  String? caption;
  String? url;
  String? createdAt;

  MediaDto({
    this.id,
    this.type,
    this.title,
    this.content,
    this.caption,
    this.url,
    this.createdAt,
  });

  Map<String, dynamic> toJson() => _$MediaDtoToJson(this);

  factory MediaDto.fromJson(Map<String, dynamic> json) =>
      _$MediaDtoFromJson(json);
}
