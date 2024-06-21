import 'timeout_future.dart';

Future<void> main() async {
  print(
      await timeoutFuture().timeout(Duration(seconds: 5), onTimeout: () async {
    return 'timeout';
    // return await Future.error(Exception('timeout'));
  }));
}
