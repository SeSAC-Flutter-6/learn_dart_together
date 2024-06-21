import 'dart:async';
import 'dart:io';

import 'package:learn_dart_together/10_file/copy.dart';

Future<void> copyFile() async {
  final String sourcePath = 'test/15_async/sample.csv';
  final String targetPath = 'test/15_async/sample_copy.csv';

  try {
    await File(sourcePath).writeAsString('1, 홍길동, 30 \n2, 한석봉, 20');
    await copy(sourcePath, targetPath);
    File targetFile = File(targetPath);
    String text = await targetFile.readAsString();
    String replacedText = text.replaceAll('한석봉', '김석봉');
    await targetFile.writeAsString(replacedText);
  } catch (e) {
    print('Error: $e');
  }
}

void main() async {
  await copyFile();
}
