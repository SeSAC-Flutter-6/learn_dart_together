import 'dart:io';

import 'package:learn_dart_together/09_exception_file_data/file.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  test('복사한 파일의 내용은 오리지날과 같습니다.', () {
    String source = 'abc.txt';
    String target = 'def.txt';
    final originFile = File(source);
    originFile.writeAsStringSync('Hello World!');
    final targetFile = File(target);
    targetFile.writeAsStringSync('');
    copy(source, target);

    expect(originFile.readAsStringSync(), targetFile.readAsStringSync());
  });
}
