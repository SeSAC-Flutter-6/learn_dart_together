import 'dart:io';

void copy(String source, String target) {
  final File sourceFile = File(source);

  final File targetFile = File(target);

  final contents = sourceFile.readAsStringSync();

  targetFile.writeAsStringSync(contents);

  print(targetFile);
}
