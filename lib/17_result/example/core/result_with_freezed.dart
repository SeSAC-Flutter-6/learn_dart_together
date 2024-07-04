import 'package:freezed_annotation/freezed_annotation.dart';

part 'result_with_freezed.freezed.dart';

@freezed
sealed class ResultWithFreezed<T> with _$ResultWithFreezed<T> {
  const factory ResultWithFreezed.success(T data) = Success;
  const factory ResultWithFreezed.error(String e) = Error;
}
