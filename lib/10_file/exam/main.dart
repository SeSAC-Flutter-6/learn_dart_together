import 'dart:io';

void main() {
  final file = File('save.txt'); // 파일 열기

  // 내용 쓰기(기존에 내용이 있으면 지워지고 새로 써짐)
  file.writeAsStringSync('copy 테스트 입니다.');

  // 파일 없을시 PathNotFoundException: Cannot open file 에러 발생
  final text = file.readAsStringSync();
  print(text);
}
