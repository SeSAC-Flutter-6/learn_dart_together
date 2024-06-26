import 'dart:io';

void main() {
  changeFile('lib/17_async/sample.csv', 'lib/17_async/sample_copy.csv');
}

void changeFile(String path, String target) async {
  try {
    File source = File(path);
    String text = await source.readAsString();
    text = text.replaceAll('한석봉', '김석봉');
    File result = File(target);
    await result.writeAsString(text);
  } catch (e) {
    print('파일을 찾을 수 없습니다: $e');
  }
}
