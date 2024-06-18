import 'dart:io';

void copy(String source, String target) {
  File sourceFile = File(source);

  File targetFile = File(target);

  final contents = sourceFile.readAsStringSync();

  targetFile.writeAsStringSync(contents);

  print(targetFile);
}
