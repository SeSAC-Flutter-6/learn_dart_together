import 'dart:io';

void main() {
  copy('lib/09_2_file_control/testFile.txt', 'lib/09_2_file_control/copiedTestFile.txt');
}

void copy(String source, String target) {
  final File originalFile = File(source);
  final String text = originalFile.readAsStringSync();

  File(target).writeAsStringSync(text);
}