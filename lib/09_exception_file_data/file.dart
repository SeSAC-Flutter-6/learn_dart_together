import 'dart:io';

void copy(String source, String target) {
  final originFile = File(source);
  final text = originFile.readAsStringSync();

  final targetFile = File(target);
  targetFile.writeAsStringSync(text);
}
