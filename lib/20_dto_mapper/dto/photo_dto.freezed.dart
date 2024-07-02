// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'photo_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PhotoDto _$PhotoDtoFromJson(Map<String, dynamic> json) {
  return _PhotoDto.fromJson(json);
}

/// @nodoc
mixin _$PhotoDto {
  num? get id => throw _privateConstructorUsedError;
  @JsonKey(unknownEnumValue: PhotoEnum.unknown)
  PhotoEnum? get type => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;
  String? get caption => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PhotoDtoCopyWith<PhotoDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhotoDtoCopyWith<$Res> {
  factory $PhotoDtoCopyWith(PhotoDto value, $Res Function(PhotoDto) then) =
      _$PhotoDtoCopyWithImpl<$Res, PhotoDto>;
  @useResult
  $Res call(
      {num? id,
      @JsonKey(unknownEnumValue: PhotoEnum.unknown) PhotoEnum? type,
      String? url,
      String? caption,
      DateTime? createdAt});
}

/// @nodoc
class _$PhotoDtoCopyWithImpl<$Res, $Val extends PhotoDto>
    implements $PhotoDtoCopyWith<$Res> {
  _$PhotoDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? type = freezed,
    Object? url = freezed,
    Object? caption = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as num?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as PhotoEnum?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      caption: freezed == caption
          ? _value.caption
          : caption // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PhotoDtoImplCopyWith<$Res>
    implements $PhotoDtoCopyWith<$Res> {
  factory _$$PhotoDtoImplCopyWith(
          _$PhotoDtoImpl value, $Res Function(_$PhotoDtoImpl) then) =
      __$$PhotoDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {num? id,
      @JsonKey(unknownEnumValue: PhotoEnum.unknown) PhotoEnum? type,
      String? url,
      String? caption,
      DateTime? createdAt});
}

/// @nodoc
class __$$PhotoDtoImplCopyWithImpl<$Res>
    extends _$PhotoDtoCopyWithImpl<$Res, _$PhotoDtoImpl>
    implements _$$PhotoDtoImplCopyWith<$Res> {
  __$$PhotoDtoImplCopyWithImpl(
      _$PhotoDtoImpl _value, $Res Function(_$PhotoDtoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? type = freezed,
    Object? url = freezed,
    Object? caption = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$PhotoDtoImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as num?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as PhotoEnum?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      caption: freezed == caption
          ? _value.caption
          : caption // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PhotoDtoImpl implements _PhotoDto {
  _$PhotoDtoImpl(
      {this.id,
      @JsonKey(unknownEnumValue: PhotoEnum.unknown) this.type,
      this.url,
      this.caption,
      this.createdAt});

  factory _$PhotoDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PhotoDtoImplFromJson(json);

  @override
  final num? id;
  @override
  @JsonKey(unknownEnumValue: PhotoEnum.unknown)
  final PhotoEnum? type;
  @override
  final String? url;
  @override
  final String? caption;
  @override
  final DateTime? createdAt;

  @override
  String toString() {
    return 'PhotoDto(id: $id, type: $type, url: $url, caption: $caption, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PhotoDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.caption, caption) || other.caption == caption) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, type, url, caption, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PhotoDtoImplCopyWith<_$PhotoDtoImpl> get copyWith =>
      __$$PhotoDtoImplCopyWithImpl<_$PhotoDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PhotoDtoImplToJson(
      this,
    );
  }
}

abstract class _PhotoDto implements PhotoDto {
  factory _PhotoDto(
      {final num? id,
      @JsonKey(unknownEnumValue: PhotoEnum.unknown) final PhotoEnum? type,
      final String? url,
      final String? caption,
      final DateTime? createdAt}) = _$PhotoDtoImpl;

  factory _PhotoDto.fromJson(Map<String, dynamic> json) =
      _$PhotoDtoImpl.fromJson;

  @override
  num? get id;
  @override
  @JsonKey(unknownEnumValue: PhotoEnum.unknown)
  PhotoEnum? get type;
  @override
  String? get url;
  @override
  String? get caption;
  @override
  DateTime? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$PhotoDtoImplCopyWith<_$PhotoDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
