import 'dart:io';

Future<void> fileRead(String sourceFile, String targetFile, String sourceString,
    String targetString) async {
  final sourceFileGiven = File(sourceFile);
  final targetFileGiven = File(targetFile);

  if (!sourceFileGiven.existsSync()) {
    await Future.error(Exception('파일을 찾을 수 없습니다.'));
  }

  String text = await sourceFileGiven.readAsString();

  await targetFileGiven
      .writeAsString(text.replaceAll(sourceString, targetString));
}
