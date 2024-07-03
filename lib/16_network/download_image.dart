import 'dart:io';
import 'dart:typed_data';

import 'package:http/http.dart' as http;

Future<Uint8List> downloadImage(String url) async {
  final http.Response response = await http.get(Uri.parse(url));

  return response.bodyBytes;
}

Future<File> saveFile(Uint8List bytes, String filename) async {
  final file = File(filename);
  file.writeAsBytesSync(bytes);
  
  return file;
}

Future<void> main() async {
  final getByte = await downloadImage('https://alimipro.com/favicon.ico');
  final setDirectory = 'lib/16_network';

  await saveFile(getByte, '$setDirectory/icon.ico');
}