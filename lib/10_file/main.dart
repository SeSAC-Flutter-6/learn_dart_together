import 'dart:io';

void main() {
  final file = File('abc.txt');
  
  file.writeAsStringSync('Hello');
  file.writeAsStringSync('Hello', mode: FileMode.append);
  file.writeAsStringSync('Hello', mode: FileMode.append);
  file.writeAsStringSync('Hello', mode: FileMode.append);

  copy('abc.txt', 'def.txt');
}

void copy(String source, String target) {

}