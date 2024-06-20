import 'dart:async';

Future<void> main() async {
  Future<String> timeoutFuture() async {
    await Future.delayed(Duration(seconds: 6));
    return 'ok';
  }

  try {
    await timeoutFuture().timeout(const Duration(seconds: 5));
  } on TimeoutException {
    print('time out');
  }
}
