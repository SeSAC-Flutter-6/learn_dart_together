import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:learn_dart_together/17_result/calculator/exception/exception.dart';

part 'result.freezed.dart';

@freezed
sealed class Result<T> with _$Result<T> {
  const factory Result.success(T data) = Success;
  const factory Result.error(ErrorList error) = Error;
}