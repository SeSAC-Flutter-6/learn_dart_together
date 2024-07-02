// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'store_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StoreDto _$StoreDtoFromJson(Map<String, dynamic> json) {
  return _StoreDto.fromJson(json);
}

/// @nodoc
mixin _$StoreDto {
  String? get addr => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  num? get lat => throw _privateConstructorUsedError;
  num? get lng => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get remainStat => throw _privateConstructorUsedError;
  String? get stockAt => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StoreDtoCopyWith<StoreDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoreDtoCopyWith<$Res> {
  factory $StoreDtoCopyWith(StoreDto value, $Res Function(StoreDto) then) =
      _$StoreDtoCopyWithImpl<$Res, StoreDto>;
  @useResult
  $Res call(
      {String? addr,
      String? code,
      String? createdAt,
      num? lat,
      num? lng,
      String? name,
      String? remainStat,
      String? stockAt,
      String? type});
}

/// @nodoc
class _$StoreDtoCopyWithImpl<$Res, $Val extends StoreDto>
    implements $StoreDtoCopyWith<$Res> {
  _$StoreDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addr = freezed,
    Object? code = freezed,
    Object? createdAt = freezed,
    Object? lat = freezed,
    Object? lng = freezed,
    Object? name = freezed,
    Object? remainStat = freezed,
    Object? stockAt = freezed,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      addr: freezed == addr
          ? _value.addr
          : addr // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      lat: freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as num?,
      lng: freezed == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as num?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      remainStat: freezed == remainStat
          ? _value.remainStat
          : remainStat // ignore: cast_nullable_to_non_nullable
              as String?,
      stockAt: freezed == stockAt
          ? _value.stockAt
          : stockAt // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StoreDtoImplCopyWith<$Res>
    implements $StoreDtoCopyWith<$Res> {
  factory _$$StoreDtoImplCopyWith(
          _$StoreDtoImpl value, $Res Function(_$StoreDtoImpl) then) =
      __$$StoreDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? addr,
      String? code,
      String? createdAt,
      num? lat,
      num? lng,
      String? name,
      String? remainStat,
      String? stockAt,
      String? type});
}

/// @nodoc
class __$$StoreDtoImplCopyWithImpl<$Res>
    extends _$StoreDtoCopyWithImpl<$Res, _$StoreDtoImpl>
    implements _$$StoreDtoImplCopyWith<$Res> {
  __$$StoreDtoImplCopyWithImpl(
      _$StoreDtoImpl _value, $Res Function(_$StoreDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addr = freezed,
    Object? code = freezed,
    Object? createdAt = freezed,
    Object? lat = freezed,
    Object? lng = freezed,
    Object? name = freezed,
    Object? remainStat = freezed,
    Object? stockAt = freezed,
    Object? type = freezed,
  }) {
    return _then(_$StoreDtoImpl(
      freezed == addr
          ? _value.addr
          : addr // ignore: cast_nullable_to_non_nullable
              as String?,
      freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      freezed == lat
          ? _value.lat
          : lat // ignore: cast_nullable_to_non_nullable
              as num?,
      freezed == lng
          ? _value.lng
          : lng // ignore: cast_nullable_to_non_nullable
              as num?,
      freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      freezed == remainStat
          ? _value.remainStat
          : remainStat // ignore: cast_nullable_to_non_nullable
              as String?,
      freezed == stockAt
          ? _value.stockAt
          : stockAt // ignore: cast_nullable_to_non_nullable
              as String?,
      freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StoreDtoImpl implements _StoreDto {
  _$StoreDtoImpl(this.addr, this.code, this.createdAt, this.lat, this.lng,
      this.name, this.remainStat, this.stockAt, this.type);

  factory _$StoreDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$StoreDtoImplFromJson(json);

  @override
  final String? addr;
  @override
  final String? code;
  @override
  final String? createdAt;
  @override
  final num? lat;
  @override
  final num? lng;
  @override
  final String? name;
  @override
  final String? remainStat;
  @override
  final String? stockAt;
  @override
  final String? type;

  @override
  String toString() {
    return 'StoreDto(addr: $addr, code: $code, createdAt: $createdAt, lat: $lat, lng: $lng, name: $name, remainStat: $remainStat, stockAt: $stockAt, type: $type)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoreDtoImpl &&
            (identical(other.addr, addr) || other.addr == addr) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.lat, lat) || other.lat == lat) &&
            (identical(other.lng, lng) || other.lng == lng) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.remainStat, remainStat) ||
                other.remainStat == remainStat) &&
            (identical(other.stockAt, stockAt) || other.stockAt == stockAt) &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, addr, code, createdAt, lat, lng,
      name, remainStat, stockAt, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StoreDtoImplCopyWith<_$StoreDtoImpl> get copyWith =>
      __$$StoreDtoImplCopyWithImpl<_$StoreDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StoreDtoImplToJson(
      this,
    );
  }
}

abstract class _StoreDto implements StoreDto {
  factory _StoreDto(
      final String? addr,
      final String? code,
      final String? createdAt,
      final num? lat,
      final num? lng,
      final String? name,
      final String? remainStat,
      final String? stockAt,
      final String? type) = _$StoreDtoImpl;

  factory _StoreDto.fromJson(Map<String, dynamic> json) =
      _$StoreDtoImpl.fromJson;

  @override
  String? get addr;
  @override
  String? get code;
  @override
  String? get createdAt;
  @override
  num? get lat;
  @override
  num? get lng;
  @override
  String? get name;
  @override
  String? get remainStat;
  @override
  String? get stockAt;
  @override
  String? get type;
  @override
  @JsonKey(ignore: true)
  _$$StoreDtoImplCopyWith<_$StoreDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
