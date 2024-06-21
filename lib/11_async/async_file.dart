import 'dart:io';

Future<void> copyWriteFile() async {
  final File file = File('sample.csv');
  file.exists().then((exist) async {
    if (exist) {
      final fileText = await file.readAsString();
      final File newFile = File('sample_copy.csv');
      await newFile.writeAsString(fileText.replaceAll('한석봉', '김석봉'));
      print(await newFile.readAsString());
    } else {
      throw Exception('파일이 존재하지 않습니다.');
    }
  });
}

void main() {
  copyWriteFile();
}
