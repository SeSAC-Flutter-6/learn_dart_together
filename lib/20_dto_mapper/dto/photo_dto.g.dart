// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PhotoDtoImpl _$$PhotoDtoImplFromJson(Map<String, dynamic> json) =>
    _$PhotoDtoImpl(
      id: json['id'] as num?,
      type: $enumDecodeNullable(_$PhotoEnumEnumMap, json['type'],
          unknownValue: PhotoEnum.unknown),
      url: json['url'] as String?,
      caption: json['caption'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$PhotoDtoImplToJson(_$PhotoDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$PhotoEnumEnumMap[instance.type],
      'url': instance.url,
      'caption': instance.caption,
      'createdAt': instance.createdAt?.toIso8601String(),
    };

const _$PhotoEnumEnumMap = {
  PhotoEnum.Article: 'Article',
  PhotoEnum.Image: 'Image',
  PhotoEnum.Video: 'Video',
  PhotoEnum.unknown: 'unknown',
};
