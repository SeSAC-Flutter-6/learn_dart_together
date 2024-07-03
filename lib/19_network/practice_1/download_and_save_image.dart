import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'dart:io';

class DownloadAndSaveImage {
  static final DownloadAndSaveImage _instance =
      DownloadAndSaveImage._internal();

  factory DownloadAndSaveImage() {
    return _instance;
  }

  DownloadAndSaveImage._internal();

  Future<Uint8List> downloadImage(String url) async {
    final http.Response response = await http.get(Uri.parse(url));
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

  try {
    await downloadAndSaveImage.saveFile(
        await downloadAndSaveImage
            .downloadImage('https://alimipro.com/favicon.ico'),
        './lib/19_network/practice_1/icon.ico');
  } catch (e) {
    print(e);
  }
}
