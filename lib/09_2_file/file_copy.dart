import 'dart:io';

void main() {

  copy('abc.txt', 'copy/');
 
}

void copy(String source, String target) {
  File sourceFile = File(source);
  File copyFile = sourceFile.copySync(target);
}
