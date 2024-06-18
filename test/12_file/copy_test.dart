import 'dart:io';

import 'package:learn_dart_together/12_file/copy.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  test('copy(source,target)을 하면 파일이 복사된다. ', () {
    File file = File('lib/12_file/abc.txt');
    copy('lib/12_file/abc.txt', 'lib/12_file/result.txt');
    File result = File('lib/12_file/result.txt');
    expect(file.readAsStringSync() == result.readAsStringSync(), true);
  });
}
