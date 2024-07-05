import 'package:freezed_annotation/freezed_annotation.dart';

part 'result_double_generic.freezed.dart';

@freezed
sealed class ResultDoubleGeneric<D, E> with _$ResultDoubleGeneric<D, E> {
  const factory ResultDoubleGeneric.success(D data) = Success;
  const factory ResultDoubleGeneric.error(E error) = Error;
}
