import 'package:learn_dart_together/20_dto_mapper/enum/enum_photo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'photo_dto.freezed.dart';
part 'photo_dto.g.dart';

@freezed
class PhotoDto with _$PhotoDto {
  factory PhotoDto({
    num? id,
    @JsonKey(unknownEnumValue: PhotoEnum.unknown) PhotoEnum? type,
    String? url,
    String? caption,
    DateTime? createdAt,
  }) = _PhotoDto;

  factory PhotoDto.fromJson(Map<String, dynamic> json) =>
      _$PhotoDtoFromJson(json);
}
