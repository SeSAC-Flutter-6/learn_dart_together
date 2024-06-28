import 'package:collection/collection.dart';
import 'package:learn_dart_together/15_dto/photo_assingment/datasource/photo_data_source.dart';
import 'package:learn_dart_together/15_dto/photo_assingment/dto/photo_dto.dart';

class MockPhotoApi implements PhotoDataSource {
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
    }
  ];

  @override
  Future<PhotoDto?> getPhoto(int id) async {
    final result =
        _jsonList.singleWhereOrNull((json) => PhotoDto.fromJson(json).id == id);

    return (result != null) ? PhotoDto.fromJson(result) : null;
  }

  @override
  Future<List<PhotoDto>> getPhotos() async {
    return _jsonList.map((json) => PhotoDto.fromJson(json)).toList();
  }
}
