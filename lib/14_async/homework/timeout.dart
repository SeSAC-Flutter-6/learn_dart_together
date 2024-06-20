import 'dart:async';

void main() async {
  //1번 방식
  var result = await timeoutFuture()
      .timeout(Duration(seconds: 5), onTimeout: () => 'timeout');
  print(result);

  //2번 방식
  try {
    await timeoutFuture().timeout(const Duration(seconds: 5));
  } on TimeoutException {
    print('timeout');
  }
}

Future<String> timeoutFuture() async {
  await Future.delayed(Duration(seconds: 6));
  return 'ok';
}
