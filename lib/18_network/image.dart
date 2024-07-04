import 'dart:io';
import 'dart:typed_data';
import 'package:http/http.dart' as http;

Future<Uint8List> downloadImage(String url) async {
  final response = await http.get(Uri.parse(url));
  return response.bodyBytes;
}

Future<File> saveFile(Uint8List bytes, String path, String fileName) async {
  final filePath = path.endsWith('/') ? path : '$path/';
  final file = await File('$filePath$fileName').writeAsBytes(bytes);
  return file;
}

void main() async {
  final image = await downloadImage('https://alimipro.com/favicon.ico');
  await saveFile(image, 'lib/18_network', 'icon.ico');
}
