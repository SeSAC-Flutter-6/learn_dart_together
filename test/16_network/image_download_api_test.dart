import 'package:learn_dart_together/16_network/data_source/image_download/image_download_api.dart';
import 'package:test/test.dart';

Future<void> main() async {
  test('이미지 다운로드 테스트', () async {
    final imageApi = ImageDownloadApi();
    final String testUrl = 'https://alimipro.com/favicon.ico';
    final imageBytes = await imageApi.downloadImage(testUrl);
    final file =
        await imageApi.saveFile(bytes: imageBytes, filePath: 'test/16_network');
    expect(file.path, 'test/16_network/icon.ico');
  });
}
