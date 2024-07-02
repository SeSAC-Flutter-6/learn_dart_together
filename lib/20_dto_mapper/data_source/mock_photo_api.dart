import 'package:learn_dart_together/20_dto_mapper/dto/photo_dto.dart';

class MockPhotoApi {
  List<Map<String, dynamic>> mockPhoto = [
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

  Future<List<PhotoDto>> getPhoto() async {
    return mockPhoto.map((e) {
      var id = e['id'];
      if (id is String) {
        try {
          id = int.parse(id);
        } catch (e) {
          id = 0;
        }
      }
      return PhotoDto.fromJson({...e, 'id': id});
    }).toList();
  }
}

Future<void> main() async {
  final api = MockPhotoApi();
  final photos = await api.getPhoto();
  photos.forEach((photo) {
    print(photo);
  });
}
