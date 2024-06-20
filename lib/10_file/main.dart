import 'dart:io';

void main() {
  final file = File('abc.txt');

  file.writeAsStringSync('Hello'); //열고 닫기. 안 닫아도 알아서 닫아줘서 신경 쓸 게 없다
  file.writeAsStringSync('Hello', mode: FileMode.append); //append: 기본적으로 엎는 것

  copy('abc.txt', 'def.txt');
}

void copy(String source, String target) {}
