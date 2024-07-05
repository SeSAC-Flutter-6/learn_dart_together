// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MediaDto _$MediaDtoFromJson(Map<String, dynamic> json) => MediaDto(
      id: (json['id'] as num?)?.toInt(),
      type: json['type'] as String?,
      title: json['title'] as String?,
      content: json['content'] as String?,
      caption: json['caption'] as String?,
      url: json['url'] as String?,
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$MediaDtoToJson(MediaDto instance) => <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'title': instance.title,
      'content': instance.content,
      'caption': instance.caption,
      'url': instance.url,
      'createdAt': instance.createdAt,
    };
