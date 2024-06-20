import 'package:learn_dart_together/11_sync_async/timeout.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  test('타임아웃 익셉션', () async {
    expect(() async => await timeoutFuture().timeout(Duration(seconds: 2)), throwsException);
  });
}