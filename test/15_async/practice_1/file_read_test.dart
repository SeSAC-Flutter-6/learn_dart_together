import 'package:test/test.dart';
import 'dart:io';
import 'package:learn_dart_together/15_async/practice_1/file_read.dart';

void main() {
  final sourceFile = './test/15_async/practice_1/test.csv';
  final targetFile = './test/15_async/practice_1/test_copy.csv';
  group('파일 처리 테스트', () {
    setUp(() async {
      await File(sourceFile).writeAsString('1,홍길동,30\n2,한석봉,20');
    });
    tearDown(() async {
      await File(sourceFile).delete();
    });

    test('파일을 읽은 후, 특정 문자열이 있는지 찾아 원하는 문자열로 수정한다', () async {
      await fileRead(sourceFile, targetFile, '한석봉', '김석봉');
      final fileContent = await File(targetFile).readAsString();
      expect(fileContent, '1,홍길동,30\n2,김석봉,20');
      File(targetFile).delete();
    });
    test('파일을 찾을 수 없는 경우에는 예외 처리를 한다', () async {
      final wrongSourceFile = './test/15_async/practice_1/test_wrong.csv';
      // final fileContent = await File(targetFile).readAsString();
      expect(
        () async => await fileRead(wrongSourceFile, targetFile, '한석봉', '김석봉'),
        throwsA(isA<Exception>()),
      );
    });
  });
}
