import 'dart:io';

void main() {
  copy('save.txt', 'copy_save.txt');
}

void copy(String source, String target) {
  final file = File(source);
  final copyfile = File(target);

  copyfile.writeAsStringSync(file.readAsStringSync());
}
