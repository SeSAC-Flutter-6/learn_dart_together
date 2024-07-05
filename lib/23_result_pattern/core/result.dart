sealed class Result<T> {
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
  Result<int> result2 = Result.error('어쩌구저쩌구');

  switch (result) {
    case Success<int>():
      print(result.data);
    case Error<int>(): // Error 만 쳐다본다.
      print(result.message);
  }
}

//리졸트 패턴을 구현하는 방법은 많지만 sealed 클래스를 이용하면 switch와 엮어서 사용할 수 있는 장점때문에 사용한다.
