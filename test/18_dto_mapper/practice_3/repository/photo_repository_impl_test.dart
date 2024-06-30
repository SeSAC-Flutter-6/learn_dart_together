import 'package:learn_dart_together/18_dto_mapper/practice_3/data_source/mock_photo_api.dart';
import 'package:learn_dart_together/18_dto_mapper/practice_3/dto/photo_dto.dart';
import 'package:learn_dart_together/18_dto_mapper/practice_3/mapper/content_mapper.dart';
import 'package:learn_dart_together/18_dto_mapper/practice_3/repository/photo_repository.dart';
import 'package:learn_dart_together/18_dto_mapper/practice_3/repository/photo_repository_impl.dart';
import 'package:test/test.dart';
import 'package:collection/collection.dart';

void main() {
  final json = [
    {
      "id": 1,
      "type": "article",
      "title": "This is an article",
      "content": "This is the content of the article.",
      "created_at": "2020-01-01"
    },
    {
      "id": 2,
      "type": "image",
      "url": "https://example.com/image.jpg",
      "caption": "This is an image.",
      "created_at": "2020-02-02"
    },
    {
      "id": 3,
      "type": "video",
      "url": "https://example.com/video.mp4",
      "caption": "This is a video.",
      "created_at": "2020-03-03"
    },
    {
      "id": "1",
      "type": "article",
      "title": "This is an article",
      "content": "This is the content of the article.",
      "created_at": "2020-01-01"
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
      "url": "https://example.com/video.mp4",
      "caption": "This is a video.",
      "created_at": "2020-03-03"
    }
  ];

  PhotoRepository photoRepositoryImpl = PhotoRepositoryImpl(MockPhotoApi());

  group('MockPhotoApi 테스트', () {
    test('description', () async {
      final actualData = await photoRepositoryImpl.getAllPhotos();
      final testData = json.map((e) => PhotoDto.fromJson(e).toPhoto()).toList();
      expect(IterableEquality().equals(actualData, testData), true);
    });
  });
}
