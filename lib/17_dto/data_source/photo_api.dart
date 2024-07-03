import 'package:learn_dart_together/17_dto/dto/photo_dto.dart';

abstract interface class PhotoApi {
  Future<List<PhotoDto>> getPhotos();
}

class MockPhotoApi implements PhotoApi {
  final List<Map<String, dynamic>> _photos = [
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

  @override
  Future<List<PhotoDto>> getPhotos() async {
    return _photos.map((e) => PhotoDto.fromJson(e)).toList();
  }
}
