import 'package:collection/collection.dart';
import 'package:learn_dart_together/17_dto/data_source/photo_api.dart';
import 'package:learn_dart_together/17_dto/dto/photo_dto.dart';
import 'package:learn_dart_together/17_dto/mapper/photo_mapper.dart';
import 'package:learn_dart_together/17_dto/repository/photo_repository.dart';
import 'package:test/test.dart';

void main() {
  test('getUsers()를 하면 photoApi의 데이터를 List<Photo>로 리턴', () async {
    final repository = PhotoRepositoryImpl(MockPhotoApi());
    final photos = await repository.getPhotos();

    expect(
        photos.equals([
          PhotoDto.fromJson({
            "id": "1",
            "type": "article",
            "title": "This is an article",
            "content": "This is the content of the article.",
            "created_at": "2020-01-01"
          }).toPhoto(),
          PhotoDto.fromJson({
            "id": 2,
            "type": null,
            "url": "https://example.com/image.jpg",
            "caption": "This is an image.",
            "created_at": "2020-02-02"
          }).toPhoto(),
          PhotoDto.fromJson({
            "id": 3,
            "url": "https://example.com/video.mp4",
            "caption": "This is a video.",
            "created_at": "2020-03-03"
          }).toPhoto()
        ]),
        true);
  });
}
