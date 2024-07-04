import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';

@freezed
sealed class Result<T> with _$Result<T> {
  factory Result.success(T data) = Success;
  factory Result.error(Exception e) = Error;
}