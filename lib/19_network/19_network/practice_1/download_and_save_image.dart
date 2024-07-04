import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'dart:io';

class DownloadAndSaveImage {
  Future<Uint8List> downloadImage(String url) async {
    final http.Response response =
        await http.get(Uri.parse('https://alimipro.com/favicon.ico'));
    return response.bodyBytes;
  }

  Future<File> saveFile(Uint8List bytes, String filename) async {
    final File file = File(filename);
    await file.writeAsBytes(bytes);
    return file;
  }
}

void main() async {
  DownloadAndSaveImage downloadAndSaveImage = DownloadAndSaveImage();
  Uint8List imageData = await downloadAndSaveImage
      .downloadImage('https://alimipro.com/favicon.ico');
  // print(imageData);
  File file = await downloadAndSaveImage.saveFile(
      imageData, './lib/19_network/practice_1/icon.ico');
  // print(file);
}
