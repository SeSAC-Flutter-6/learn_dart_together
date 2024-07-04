import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';

@freezed
sealed class Result<T> with _$Result<T> {
  const factory Result.success(T data) = Success;
  const factory Result.error(String message) = Error;
}



// sealed class Result<T> {
//   factory Result.success(T data) = Success;
//   factory Result.error(String message) = Error;
// }
//
// class Success<T> implements Result<T> {
//   T data;
//
//   Success(this.data);
// }
//
// class Error<T> implements Result<T> {
//   String message;
//
//   Error(this.message);
// }

void main() {
  Result<int> result = Result.success(10);
  Result<int> result2 = Result.error('어쩌구 저쩌구');

  switch(result) {
    case Success<int>():
      print(result.data);
    case Error<int>():
      print(result.message);
  }
}