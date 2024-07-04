import 'dart:io';
import 'dart:typed_data';
import 'package:http/http.dart' as http;

class PictureApi {
  final http.Client _client;

  PictureApi({http.Client? client}) : _client = client ?? http.Client();

  Future<Uint8List> downloadImage(String url) async {
    final response = await _client.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return response.bodyBytes;
    } else {
      throw Exception('Failed to download image: ${response.statusCode}');
    }
  }

  Future<File> saveFile(Uint8List bytes, String fileName) async {
    final file = File(fileName);
    return await file.writeAsBytes(bytes);
  }

  Future<void> getPicture() async {
    try {
      Uint8List imageBytes =
          await downloadImage('https://alimipro.com/favicon.ico');
      File file = await saveFile(imageBytes, 'icon.ico');
      print('File saved successfully at ${file.path}');
    } catch (e) {
      print('Error: $e');
    }
  }

  void printClient() {
    print(_client); // _client를 출력하는 메서드
  }
}

void main() async {
  PictureApi pictureApi = PictureApi();
  pictureApi.printClient(); // _client 출력

  http.Client customClient = http.Client();
  PictureApi customPictureApi = PictureApi(client: customClient);
  customPictureApi.printClient(); // customClient 출력

  await pictureApi.getPicture();
}
