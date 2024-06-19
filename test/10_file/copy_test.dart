import 'dart:io';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';
import 'package:learn_dart_together/10_file/copy.dart';

void main() {
  test('copy file test', () {
    File test = File('lib/10_file/test.txt');
    final string = '파일내용작성';
    test.writeAsStringSync(string);
    copy('lib/10_file/test.txt', 'lib/10_file/testCopy.txt');
    File testCopy = File('lib/10_file/testCopy.txt');
    String contentCopy = testCopy.readAsStringSync();
    expect(contentCopy, equals(string));
  });
}
