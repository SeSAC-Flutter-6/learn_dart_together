import 'package:learn_dart_together/13_model/data/data_source/photo_data_source.dart';
import 'package:learn_dart_together/13_model/data/model/photo.dart';
import 'package:learn_dart_together/13_model/data/repositoryImpl/photo_repository_impl.dart';
import 'package:test/test.dart';

void main() {
  final mockUrl = 'https://e254ed56-e38f-4ffc-a299-03777024cd24.mock.pstmn.io/getPhotos';
  final jsonData = [
    {
      "albumId": 1,
      "id": 1,
      "title": "accusamus beatae ad facilis cum similique qui sunt",
      "url": "https://via.placeholder.com/600/92c952",
      "thumbnailUrl": "https://via.placeholder.com/150/92c952"
    },
    {
      "albumId": 1,
      "id": 2,
      "title": "reprehenderit est deserunt velit ipsam",
      "url": "https://via.placeholder.com/600/771796",
      "thumbnailUrl": "https://via.placeholder.com/150/771796"
    }
  ];

  test('', () async {
    final photoDataSource = PhotoDataSource(baseUrl: mockUrl);
    final photoRepositoryImpl = PhotoRepositoryImpl(photoDataSource);
    final fakeData = await photoRepositoryImpl.getPhotos(1);

    final testData = jsonData.map((json) => Photo.fromJson(json)).toList();
    expect(testData, fakeData);
  });
}
