import 'package:learn_dart_together/10_file/practice/file_empty_exception.dart';
import 'package:test/test.dart';
import 'package:learn_dart_together/10_file/practice/copy.dart';
import 'dart:io';

void main() {
  String source;
  String target;
  group('copy 테스트', () {
    test('파일 복사 후, 내용이 같은지 확인한다', () {
      source = '${Directory.current.path}/lib/10_file/practice/test.txt';
      target = '${Directory.current.path}/lib/10_file/practice/test_copy.txt';

      copy(source, target);

      final sourceText = File(source).readAsStringSync();
      final targetText = File(target).readAsStringSync();

      expect(sourceText == targetText, true);

      File(target).deleteSync();
    });
    test('source 파일이 존재하지 않을 때, PathNotFoundException 에러를 발생시킨다', () {
      source =
          '${Directory.current.path}/lib/10_file/practice/test_not_exist.txt';
      target = '${Directory.current.path}/lib/10_file/practice/test_copy.txt';

      expect(() => copy(source, target), throwsA(PathNotFoundException));
    });
    test('source 파일에 내용이 없을 때, FileEmptyException 에러를 발생시킨다', () {
      source = '${Directory.current.path}/lib/10_file/practice/test_empty.txt';
      target = '${Directory.current.path}/lib/10_file/practice/test_copy.txt';

      expect(() => copy(source, target), throwsA(isA<FileEmptyException>()));
    });
    test('target 파일이 이미 존재할 때, FileSystemException 에러를 발생시킨다', () {
      source = '${Directory.current.path}/lib/10_file/practice/test.txt';
      target = '${Directory.current.path}/lib/10_file/practice/test_copy2.txt';

      expect(() => copy(source, target), throwsA(isA<FileSystemException>()));
    });
  });
}
