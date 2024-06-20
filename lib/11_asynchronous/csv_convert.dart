import 'dart:io';

Future<void> processCsvFile(
    {required String sourceFilePath, required String convertFilePath}) async {
  File inputFile = File(sourceFilePath);
  if (!await inputFile.exists()) {
    throw FileSystemException('파일을 찾을 수 없습니다.', sourceFilePath);
  }

  String csvString = await inputFile.readAsString();
  File convertedFile = File(convertFilePath);

  if (csvString.contains('한석봉')) {
    String convertedContent = csvString.replaceAll('한석봉', '김석봉');
    await convertedFile.writeAsString(convertedContent);
  } else {
    await convertedFile.writeAsString(csvString);
  }
}
