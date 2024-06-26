import 'package:test/test.dart';
import 'package:learn_dart_together/14_async/practice_3/timeout_future.dart';

void main() {
  group('timeoutFuture 테스트', () {
    test('Should complete normally within timeout', () async {
      await expectLater(timeoutFuture(), completion(equals('ok')));
    });
    // test('Should complete normally within timeout', () async {
    //   expect(await timeoutFuture(), equals('ok'));
    // });
    test('Should throw a timeout exception', () async {
      await expectLater(
          timeoutFuture()
              .timeout(Duration(seconds: 5), onTimeout: () => 'timeout'),
          completion(equals('timeout')));
    });
    // test('Should throw a timeout exception', () async {
    //   expect(
    //       await timeoutFuture()
    //           .timeout(Duration(seconds: 5), onTimeout: () => 'timeout'),
    //       equals('timeout'));
    // });
  });
}
