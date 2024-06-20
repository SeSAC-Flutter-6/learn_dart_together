import 'dart:io';

Future<void> main() async {
copy(path: 'lib/11_sync_async/sample.csv');
}

Future<void> copy({
  required String path
}) async {
  RegExp regex = RegExp(r'^(.*\/)([^\/]+)\.([^\.]+)$');
  String modifiedFileName = path.replaceAllMapped(regex, (match) {
    String path = match.group(1)!;
    String fileName = match.group(2)!;
    String extension = match.group(3)!;

    return '$path$fileName\_copy.$extension';
  });
  String content = await File(path).readAsString();
  content = content.replaceAll('한석봉', '김석봉');
  await File(modifiedFileName).writeAsString(content);
}