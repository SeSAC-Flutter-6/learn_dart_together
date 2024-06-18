import 'dart:io';
import 'file_empty_exception.dart';

void copy(String source, String target) {
  final sourceFile = File(source);
  final targetFile = File(target);
  final String contents;

  try {
    contents = sourceFile.readAsStringSync();
  } catch (e) {
    throw PathNotFoundException;
  }
  if (contents.isEmpty) {
    throw FileEmptyException('소스 파일에 내용이 없습니다.');
  }
  if (targetFile.existsSync()) {
    throw FileSystemException('대상 파일이 이미 존재합니다. $target');
  }

  targetFile.writeAsStringSync(contents);
}
