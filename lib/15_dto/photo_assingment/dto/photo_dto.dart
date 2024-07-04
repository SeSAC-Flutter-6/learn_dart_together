import 'package:json_annotation/json_annotation.dart';
import 'package:learn_dart_together/15_dto/photo_assingment/model/photo.dart';

part 'photo_dto.g.dart';

@JsonSerializable()
class PhotoDto {
  dynamic id;
  Type? type;
  String? title;
  String? content;

  @EpochDateTimeConverter()
  DateTime? createdAt;

  PhotoDto({
    this.id,
    this.type,
    this.title,
    this.content,
    this.createdAt,
  });

  factory PhotoDto.fromJson(Map<String, dynamic> json) =>
      _$PhotoDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PhotoDtoToJson(this);
}

class EpochDateTimeConverter implements JsonConverter<DateTime, int> {
  const EpochDateTimeConverter();

  @override
  DateTime fromJson(int json) => DateTime.fromMillisecondsSinceEpoch(json);

  @override
  int toJson(DateTime object) => object.millisecondsSinceEpoch;
}
