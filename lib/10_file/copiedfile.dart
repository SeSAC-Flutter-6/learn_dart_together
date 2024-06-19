import 'dart:io';

void copy(String source, String target) {
  final sourceFile = File(source);
  final content = sourceFile.readAsStringSync();

  final targetFile = File(target);
  targetFile.writeAsStringSync(content);
}
