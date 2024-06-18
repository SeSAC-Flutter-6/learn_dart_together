import 'dart:io';

void copy(String source, String target) {
  final sourceFile = File(source);
  final text = sourceFile.readAsStringSync();
  final targetFile = File(target);
  targetFile.writeAsStringSync(text);
}

void main() {
  // // 복사할 원본 파일 경로와 대상 파일 경로 설정
  // final sourcePath = 'source.txt';
  // final targetPath = 'target.txt';

  // // 원본 파일 생성 (테스트 목적)
  // File(sourcePath).writeAsStringSync('Hello, Dart!');

  // // 파일 복사 수행
  // copy(sourcePath, targetPath);

  // // 복사된 파일 내용 출력
  // final copiedText = File(targetPath).readAsStringSync();
  // print('복사된 파일의 내용: $copiedText');
}
