import 'package:learn_dart_together/15_dto_mapper/data_source/photo/photo_api.dart';
import 'package:learn_dart_together/15_dto_mapper/dto/photo_dto/photo_dto.dart';

class MockPhotoApi implements PhotoApi {
  final List<Map<String, dynamic>> _fakePhotoDataList = [
    {
      "id": "1",
      "type": "article",
      "title": "This is an article",
      "content": "This is the content of the article.",
      "created_at": "2020-01-01"
    },
    {
      "id": 2,
      "type": "image",
      "url": "https://example.com/image2.jpg",
      "caption": "This is an image.",
      "created_at": "2020-02-02"
    },
    {
      "id": "3",
      "type": "VIDEO",
      "url": "https://example.com/video3.mp4",
      "caption": "This is a video.",
      "created_at": "2020-03-03"
    },
    {
      "id": 4,
      "type": null,
      "caption": "This is a video.",
      "created_at": '2020-04-04 17:51:04.777'
    },
    {
      "id": 5,
      "url": "https://example.com/image5.png",
    }
  ];
  @override
  Future<List<PhotoDto>> getPhotos() async {
    return _fakePhotoDataList.map((e) => PhotoDto.fromJson(e)).toList();
  }
}
