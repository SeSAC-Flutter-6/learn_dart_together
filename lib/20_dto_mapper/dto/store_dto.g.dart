// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StoreDtoImpl _$$StoreDtoImplFromJson(Map<String, dynamic> json) =>
    _$StoreDtoImpl(
      json['addr'] as String?,
      json['code'] as String?,
      json['createdAt'] as String?,
      json['lat'] as num?,
      json['lng'] as num?,
      json['name'] as String?,
      json['remainStat'] as String?,
      json['stockAt'] as String?,
      json['type'] as String?,
    );

Map<String, dynamic> _$$StoreDtoImplToJson(_$StoreDtoImpl instance) =>
    <String, dynamic>{
      'addr': instance.addr,
      'code': instance.code,
      'createdAt': instance.createdAt,
      'lat': instance.lat,
      'lng': instance.lng,
      'name': instance.name,
      'remainStat': instance.remainStat,
      'stockAt': instance.stockAt,
      'type': instance.type,
    };
