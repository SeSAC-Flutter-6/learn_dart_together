// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checkout.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CheckOut _$CheckOutFromJson(Map<String, dynamic> json) {
  return _CheckOut.fromJson(json);
}

/// @nodoc
mixin _$CheckOut {
  int get id => throw _privateConstructorUsedError;
  Book get book => throw _privateConstructorUsedError;
  User get user => throw _privateConstructorUsedError;
  DateTime get checkOutDate => throw _privateConstructorUsedError;
  DateTime get dueDate => throw _privateConstructorUsedError;
  DateTime? get returnDate => throw _privateConstructorUsedError;
  int get extensionCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CheckOutCopyWith<CheckOut> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CheckOutCopyWith<$Res> {
  factory $CheckOutCopyWith(CheckOut value, $Res Function(CheckOut) then) =
      _$CheckOutCopyWithImpl<$Res, CheckOut>;
  @useResult
  $Res call(
      {int id,
      Book book,
      User user,
      DateTime checkOutDate,
      DateTime dueDate,
      DateTime? returnDate,
      int extensionCount});

  $BookCopyWith<$Res> get book;
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class _$CheckOutCopyWithImpl<$Res, $Val extends CheckOut>
    implements $CheckOutCopyWith<$Res> {
  _$CheckOutCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? book = null,
    Object? user = null,
    Object? checkOutDate = null,
    Object? dueDate = null,
    Object? returnDate = freezed,
    Object? extensionCount = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      book: null == book
          ? _value.book
          : book // ignore: cast_nullable_to_non_nullable
              as Book,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      checkOutDate: null == checkOutDate
          ? _value.checkOutDate
          : checkOutDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dueDate: null == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      returnDate: freezed == returnDate
          ? _value.returnDate
          : returnDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      extensionCount: null == extensionCount
          ? _value.extensionCount
          : extensionCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BookCopyWith<$Res> get book {
    return $BookCopyWith<$Res>(_value.book, (value) {
      return _then(_value.copyWith(book: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CheckOutImplCopyWith<$Res>
    implements $CheckOutCopyWith<$Res> {
  factory _$$CheckOutImplCopyWith(
          _$CheckOutImpl value, $Res Function(_$CheckOutImpl) then) =
      __$$CheckOutImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      Book book,
      User user,
      DateTime checkOutDate,
      DateTime dueDate,
      DateTime? returnDate,
      int extensionCount});

  @override
  $BookCopyWith<$Res> get book;
  @override
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$CheckOutImplCopyWithImpl<$Res>
    extends _$CheckOutCopyWithImpl<$Res, _$CheckOutImpl>
    implements _$$CheckOutImplCopyWith<$Res> {
  __$$CheckOutImplCopyWithImpl(
      _$CheckOutImpl _value, $Res Function(_$CheckOutImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? book = null,
    Object? user = null,
    Object? checkOutDate = null,
    Object? dueDate = null,
    Object? returnDate = freezed,
    Object? extensionCount = null,
  }) {
    return _then(_$CheckOutImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      book: null == book
          ? _value.book
          : book // ignore: cast_nullable_to_non_nullable
              as Book,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
      checkOutDate: null == checkOutDate
          ? _value.checkOutDate
          : checkOutDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      dueDate: null == dueDate
          ? _value.dueDate
          : dueDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      returnDate: freezed == returnDate
          ? _value.returnDate
          : returnDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      extensionCount: null == extensionCount
          ? _value.extensionCount
          : extensionCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CheckOutImpl implements _CheckOut {
  const _$CheckOutImpl(
      {required this.id,
      required this.book,
      required this.user,
      required this.checkOutDate,
      required this.dueDate,
      required this.returnDate,
      required this.extensionCount});

  factory _$CheckOutImpl.fromJson(Map<String, dynamic> json) =>
      _$$CheckOutImplFromJson(json);

  @override
  final int id;
  @override
  final Book book;
  @override
  final User user;
  @override
  final DateTime checkOutDate;
  @override
  final DateTime dueDate;
  @override
  final DateTime? returnDate;
  @override
  final int extensionCount;

  @override
  String toString() {
    return 'CheckOut(id: $id, book: $book, user: $user, checkOutDate: $checkOutDate, dueDate: $dueDate, returnDate: $returnDate, extensionCount: $extensionCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CheckOutImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.book, book) || other.book == book) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.checkOutDate, checkOutDate) ||
                other.checkOutDate == checkOutDate) &&
            (identical(other.dueDate, dueDate) || other.dueDate == dueDate) &&
            (identical(other.returnDate, returnDate) ||
                other.returnDate == returnDate) &&
            (identical(other.extensionCount, extensionCount) ||
                other.extensionCount == extensionCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, book, user, checkOutDate,
      dueDate, returnDate, extensionCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CheckOutImplCopyWith<_$CheckOutImpl> get copyWith =>
      __$$CheckOutImplCopyWithImpl<_$CheckOutImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CheckOutImplToJson(
      this,
    );
  }
}

abstract class _CheckOut implements CheckOut {
  const factory _CheckOut(
      {required final int id,
      required final Book book,
      required final User user,
      required final DateTime checkOutDate,
      required final DateTime dueDate,
      required final DateTime? returnDate,
      required final int extensionCount}) = _$CheckOutImpl;

  factory _CheckOut.fromJson(Map<String, dynamic> json) =
      _$CheckOutImpl.fromJson;

  @override
  int get id;
  @override
  Book get book;
  @override
  User get user;
  @override
  DateTime get checkOutDate;
  @override
  DateTime get dueDate;
  @override
  DateTime? get returnDate;
  @override
  int get extensionCount;
  @override
  @JsonKey(ignore: true)
  _$$CheckOutImplCopyWith<_$CheckOutImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
