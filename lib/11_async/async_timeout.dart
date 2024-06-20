Future<String> timeoutFuture() async {
  return await Future.delayed(
    Duration(seconds: 6),
    () {
      return 'ok';
    },
  ).timeout(
    Duration(seconds: 5),
    onTimeout: () => 'timeout',
  );
}

void main() async {
  print(await timeoutFuture());
}
