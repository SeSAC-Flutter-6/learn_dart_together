import 'dart:io';
import 'package:learn_dart_together/09_2_file_control/main.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  test('파일 복사 테스트', () {
    final source = 'lib/09_2_file_control/testFile.txt';
    final target = 'lib/09_2_file_control/copiedTestFile.txt';

    copy(source, target);

    final sourceString = File(source).readAsStringSync();
    final targetString = File(target).readAsStringSync();

    expect(sourceString, targetString);
  });
}