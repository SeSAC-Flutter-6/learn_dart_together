import 'package:collection/collection.dart';
import 'package:learn_dart_together/18_dto_mapper/data_source/media_data_source.dart';

import '../dto/media_dto.dart';

class MockMediaApi implements MediaDataSource {
  final List<Map<String, dynamic>> _jsonList = [
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

  @override
  Future<MediaDto?> getMedia(int id) async {
    var json =
        _jsonList.firstWhereOrNull((json) => json['id'] == id.toString());
    return json != null ? MediaDto.fromJson(json) : null;
  }

  @override
  Future<List<MediaDto>> getMedias() async {
    return _jsonList.map((json) => MediaDto.fromJson(json)).toList();
  }
}
