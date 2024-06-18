import 'dart:io';
import 'package:learn_dart_together/10_file/file.dart';
import 'package:test/test.dart';

void main() {
  test('copy() 함수를 이용해 source 파일을 복사한 target 파일을 생성', () {
    final source = 'lib/10_file/file.dart';
    final target = 'lib/10_file/copiedfile.dart';

    copy(source, target);

    final sourceContent = File(source).readAsStringSync();
    final targetContent = File(target).readAsStringSync();

    expect(sourceContent, targetContent);
  });
}
