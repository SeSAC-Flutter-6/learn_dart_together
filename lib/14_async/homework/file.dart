import 'dart:io';

void main() {
  fileModify();
}

void fileModify() async {
  try {
    // 파일 열기
    final file = File('lib/14_async/homework/sample.csv');

    String fileContents = await file.readAsString();
    String modifiedContents = fileContents.replaceAll('한석봉', '김석봉');

    // 파일에 다시 쓰기
    await file.writeAsString(modifiedContents);
    print(file.readAsStringSync());
  } catch (error) {
    print('파일에러: $error');
  }
}
