import 'dart:async';
import 'dart:io';

Future<void> copy(String source, String target) async {
  final File sourceFile = File(source);

  final File targetFile = File(target);

  final contents = sourceFile.readAsStringSync();

  targetFile.writeAsStringSync(contents);

  print(targetFile);
}
