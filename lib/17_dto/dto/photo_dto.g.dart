// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhotoDto _$PhotoDtoFromJson(Map<String, dynamic> json) => PhotoDto(
      id: json['id'],
      type: json['type'] as String?,
      url: json['url'] as String?,
      title: json['title'] as String?,
      content: json['content'] as String?,
      caption: json['caption'] as String?,
      created_at: json['created_at'] as String?,
    );

Map<String, dynamic> _$PhotoDtoToJson(PhotoDto instance) => <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'url': instance.url,
      'title': instance.title,
      'content': instance.content,
      'caption': instance.caption,
      'created_at': instance.created_at,
    };
