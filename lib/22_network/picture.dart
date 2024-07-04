import 'dart:io';
import 'package:http/http.dart' as http;

Future<File> downloadImage(String url, String fileName) async {
  final response = await http.get(Uri.parse(url));
  final bytes = response.bodyBytes;
  File file = File(fileName);
  return file.writeAsBytes(bytes);
}

void main() async {
  await downloadImage(
      'https://alimipro.com/favicon.ico', 'lib/22_network/icon.ico');
}
