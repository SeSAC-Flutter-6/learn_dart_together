import 'dart:io';

void main() {
  copy('lib/12_file/abc.txt', 'lib/12_file/result.txt');
}

void copy(String source, String target) {
  final file = File(source);
  final text = file.readAsStringSync();
  File(target).writeAsStringSync(text);
}
