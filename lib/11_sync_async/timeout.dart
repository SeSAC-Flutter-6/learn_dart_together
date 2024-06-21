import 'dart:async';

Future<void> main() async {
  try {
    await timeoutFuture().timeout(const Duration(seconds: 5));
  } on TimeoutException {
    print("타임 아웃!!");
  }
}

Future<String> timeoutFuture() async {
  await Future.delayed(Duration(seconds: 6));
  return 'ok';
}