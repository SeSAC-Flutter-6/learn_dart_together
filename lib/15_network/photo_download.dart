import 'dart:io';
import 'dart:typed_data';

import 'package:http/http.dart';

Future<Uint8List> downloadImage(String url) async {
  final response = await get(Uri.parse(url));

  if (response.statusCode == 200) {
    return response.bodyBytes;
  } else {
    throw Exception('Server Error');
  }
}

Future<File> saveFile(Uint8List bytes, String fileName) async {
  final File file = File('$fileName.ico');
  file.writeAsBytesSync(bytes.toList());
  return file;
}

void main() async {
  final as = await downloadImage('https://alimipro.com/favicon.ico');
  saveFile(as, 'test');
}