import 'dart:io';

void main() {
  print('Current Directory: ${Directory.current.path}');
  copy('lib/09_2_file/abc.txt', 'lib/09_2_file/def.txt');
}

void copy(String source, String target) {
  File sourceFile = File(source);
  File copyFile = File(target);
  copyFile.writeAsStringSync(sourceFile.readAsStringSync());
}
