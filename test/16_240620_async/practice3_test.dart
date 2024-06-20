import 'dart:io';
import 'dart:convert';
import 'package:test/test.dart';
import 'package:learn_dart_together/16_240620_async/practice3.dart';

void main() {
  test('timeout 테스트', () async {
    var startTime = DateTime.now();
    var result = await timeoutFuture();
    var endTime = DateTime.now();
    var elapsedTime = endTime.difference(startTime).inSeconds;

    // 테스트 결과 검증
    expect(result, equals('timeout'));
  });
}
