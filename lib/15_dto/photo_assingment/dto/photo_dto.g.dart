// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhotoDto _$PhotoDtoFromJson(Map<String, dynamic> json) => PhotoDto()
  ..id = int.tryParse(json['id'].toString())
  ..type = _$TypeEnumMap.containsKey(json['type'])
      ? $enumDecode(_$TypeEnumMap, json['type'])
      : Type.unknown
  ..title = json['title']
  ..content = json['content']
  ..createdAt = DateTime.parse(json['createdAt'] ?? "0001-01-01");

Map<String, dynamic> _$PhotoDtoToJson(PhotoDto instance) => <String, dynamic>{
      'id': instance.id,
      'type': _$TypeEnumMap[instance.type]!,
      'title': instance.title,
      'content': instance.content,
      'createdAt': instance.createdAt?.toIso8601String(),
    };

const _$TypeEnumMap = {
  Type.article: 'article',
  Type.image: 'image',
  Type.video: 'video',
  Type.unknown: 'unknown'
};
