// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BookImpl _$$BookImplFromJson(Map<String, dynamic> json) => _$BookImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      publishDate: DateTime.parse(json['publishDate'] as String),
      isLoanable: json['isLoanable'] as bool,
      returnDate: DateTime.parse(json['returnDate'] as String),
    );

Map<String, dynamic> _$$BookImplToJson(_$BookImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'publishDate': instance.publishDate.toIso8601String(),
      'isLoanable': instance.isLoanable,
      'returnDate': instance.returnDate.toIso8601String(),
    };
