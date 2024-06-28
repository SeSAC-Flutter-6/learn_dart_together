import 'package:learn_dart_together/21_dto/photo/data_source/mock_photo_data_source.dart';
import 'package:learn_dart_together/21_dto/photo/dto/photo_dto.dart';
import 'package:learn_dart_together/21_dto/photo/mapper/photo_mapper.dart';
import 'package:learn_dart_together/21_dto/photo/repository/photo_repository.dart';
import 'package:learn_dart_together/21_dto/photo/repository/photo_repository_impl.dart';
import 'package:test/test.dart';

void main() {
  final data1 = [
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
    }
  ];
  final PhotoRepository photoRepository =
      PhotoRepositoryImpl(MockPhotoDataSource());

  test('getPhotos()를 실행하면 모든 포토 객체를 리스트로 리턴함', () async {
    final data = await photoRepository.getPhotos();
    final testData =
        data1.map((e) => PhotoDto.fromJson(e)).map((e) => e.toPhoto()).toList();

    expect(data, testData);
  });
}
