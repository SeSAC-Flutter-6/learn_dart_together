import 'dart:io';
import 'copy.dart';

void main() {
  String source = '${Directory.current.path}/lib/10_file/practice/test.txt';
  String target =
      '${Directory.current.path}/lib/10_file/practice/test_copy.txt';

  copy(source, target);
}
