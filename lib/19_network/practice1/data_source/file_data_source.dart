import 'dart:io';
import 'dart:typed_data';

import 'package:http/http.dart' as http;

class FileDataSource {
  Future<Uint8List> downloadImage(String url) async {
    final responseImage = await http.get(Uri.parse(url));
    final Uint8List image = responseImage.bodyBytes;
    return image;
  }

  Future<File> saveFile(Uint8List bytes, String fileName) async {
    final String sourcePath = fileName;
    return await File(sourcePath).writeAsBytes(bytes);
  }
}

void main() async {
  final FileDataSource fileDataSource = FileDataSource();
  final image =
      await fileDataSource.downloadImage('https://alimipro.com/favicon.ico');
  final imageFile =
      await fileDataSource.saveFile(image, 'test/18_network/icon.ico');
  print(imageFile);
}
