import 'dart:io';
import 'dart:typed_data';
import 'package:http/http.dart' as http;

class ImageDownloadApi {
  Future<Uint8List> downloadImage(String url) async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return response.bodyBytes;
      } else {
        throw Exception('Failed to download image: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error downloading image: $e');
    }
  }

  Future<File> saveFile(
      {required Uint8List bytes, required String filePath}) async {
    try {
      final file = File('$filePath/icon.ico');
      await file.writeAsBytes(bytes);
      return file;
    } catch (e) {
      throw Exception('Error saving file: $e');
    }
  }
}
