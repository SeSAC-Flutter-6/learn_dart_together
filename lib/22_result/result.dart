/**
 * //core라고 둔 이유는, util성으로 여기저기 사용이 가능하기 때문에..
사실 먼저, Success,Error를 먼저 작성해 준다.
switch랑 자주 사용한다. 
추가로, Result에 아무것도 안 적어줘도 상관없다.
 */
sealed class Result<T> {
  // factory Result.success(T data)
  factory Result.success(T data) = Success;
  factory Result.error(String message) = Error;
}

class Success<T> implements Result<T> {
  T data;
  Success(this.data);
}

class Error<T> implements Result<T> {
  String message;

  Error(this.message);
}

void main() {
Result<int> result = Result.success(10);
  Result<int> result2 = Result.error('어쩌구 저쩌구');

  switch (result) {
    case Success<int>():
      print(result.data);
    case Error<int>():
      print(result.message);
  }
}
