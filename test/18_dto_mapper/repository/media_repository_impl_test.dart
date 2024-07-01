import 'package:learn_dart_together/18_dto_mapper/data_source/mock_media_api.dart';
import 'package:learn_dart_together/18_dto_mapper/dto/media_dto.dart';
import 'package:learn_dart_together/18_dto_mapper/mapper/media_mapper.dart';
import 'package:learn_dart_together/18_dto_mapper/model/media.dart';
import 'package:learn_dart_together/18_dto_mapper/repository/media_repository_impl.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group('MediaRepositoryImpl 테스트', () {
    late MediaRepositoryImpl mediaRepository;
    late MockMediaApi mockMediaApi;

    setUp(() {
      mockMediaApi = MockMediaApi();
      mediaRepository = MediaRepositoryImpl(mockMediaApi);
    });

    test('getMedia는 올바른 Media 객체를 반환해야 함', () async {
      final int mediaId = 1;

      final Media? media = await mediaRepository.getMedia(mediaId);

      expect(media, isNotNull);
      expect(media!.id, mediaId);
    });

    test('데이터에 없는 id 테스트', () async {
      final int mediaId = 8;

      final Media? media = await mediaRepository.getMedia(mediaId);

      expect(media, isNull);
    });

    test('getMedias는 Media 객체의 리스트를 반환해야 함', () async {
      // Act
      final List<Media> medias = await mediaRepository.getMedias();

      expect(medias, isNotEmpty);

      final expectedResults =
          fakeResults.map((e) => MediaDto.fromJson(e).toMedia()).toList();
      expect(medias, expectedResults);
    });
  });
}

final List<Map<String, dynamic>> fakeResults = [
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
    "url": "https://example.com/video.mp4",
    "caption": "This is a video.",
    "created_at": "2020 - 03 - 03"
  },
  {
    "id": "4",
    "type": "article",
    "title": "This is an article",
    "content": "This is the content of the article.",
    "created_at": "2020-01-01"
  },
  {
    "id": 5,
    "type": null,
    "url": "https://example.com/image.jpg",
    "caption": "This is an image.",
    "created_at": "2020-02-02"
  },
  {
    "id": 6,
    "url": "https://example.com/video.mp4",
    "caption": "This is a video.",
    "created_at": "2020-03-03"
  }
];
