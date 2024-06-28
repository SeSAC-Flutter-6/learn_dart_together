import 'package:collection/collection.dart';
import 'package:learn_dart_together/15_dto/photo_assingment/dto/photo_dto.dart';
import 'package:learn_dart_together/15_dto/photo_assingment/mapper/photo_mapper.dart';
import 'package:learn_dart_together/15_dto/photo_assingment/mock/mock_photo_api.dart';
import 'package:learn_dart_together/15_dto/photo_assingment/repository_impl/photo_repository_impl.dart';
import 'package:test/test.dart';

void main() {
  late MockPhotoApi mockPhotoApi;
  late PhotoRepositoryImpl photoRepositoryImpl;

  final List<Map<String, dynamic>> testValue = [
    {
      "id": '1',
      "type": "article",
      "title": "This is an article",
      "content": "This is the content of the article.",
      "created_at": "2020-01-01",
    },
    {
      "id": 2,
      "type": null,
      "url": "https://example.com/image.jpg",
      "caption": "This is an image.",
      "created_at": "2020-02-02"
    },
    {
      "id": 3,
      "type": "article",
      "url": "https://example.com/video.mp4",
      "caption": "This is a video.",
      "created_at": "2020-03-03"
    }
  ];

  setUpAll(() {
    mockPhotoApi = MockPhotoApi();
    photoRepositoryImpl = PhotoRepositoryImpl(mockPhotoApi);
  });

  test('getPhotos() test', () async {
    final getPhotoDto = await mockPhotoApi.getPhotos();
    final photos = getPhotoDto.map((dto) => dto.toPhoto()).toList();

    final fackREsult =
        testValue.map((json) => PhotoDto.fromJson(json).toPhoto()).toList();

    expect(photos, fackREsult);
  });

  test('getPhoto() test', () async {
    final target = 2;
    final getPhotoDto = await mockPhotoApi.getPhoto(target);
    final getPhotoId = getPhotoDto?.toPhoto().id;

    final fakeResult = testValue
        .singleWhereOrNull((json) => PhotoDto.fromJson(json).id == target);

    expect(getPhotoId, fakeResult?['id']);
  });
}
