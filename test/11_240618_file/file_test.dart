import 'dart:io';

import 'package:learn_dart_together/11_240618_file/file.dart';
import 'package:test/test.dart';

void main() {
  test('파일 복사 테스트', () {
    final test1 = File('text.txt');
    test1.writeAsStringSync('테스트 중');
    copy('text.txt', 'text2.txt');
    final test2 = File('text2.txt');
    final text = test2.readAsStringSync();
    expect(text, equals('테스트 중'));
  });
}
