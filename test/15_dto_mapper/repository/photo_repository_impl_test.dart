import 'package:learn_dart_together/15_dto_mapper/data_source/photo/mock_photo_api.dart';
import 'package:learn_dart_together/15_dto_mapper/data_source/photo/photo_api.dart';
import 'package:learn_dart_together/15_dto_mapper/model/photo.dart';
import 'package:learn_dart_together/15_dto_mapper/repository/photo/photo_repository.dart';
import 'package:learn_dart_together/15_dto_mapper/repository/photo/photo_repository_impl.dart';
import 'package:learn_dart_together/utils/date_time_util.dart';
import 'package:test/test.dart';

void main() {
  group('PhotoRepositoryImpl test', () {
    late PhotoApi photoApi;
    late PhotoRepository repository;

    setUp(() {
      photoApi = MockPhotoApi();
      repository = PhotoRepositoryImpl(photoApi: photoApi);
    });

    test('getPhotos', () async {
      List<Photo> photos = await repository.getPhotos();

      expect(photos, isNotNull);
      expect(photos.length, 5);

      expect(photos[0].id, 1);
      expect(photos[0].type, PhotoType.article);
      expect(photos[0].url, '');
      expect(photos[0].createdAt, DateTimeUtil.parseDateTime('2020-01-01'));

      expect(photos[1].id, 2);
      expect(photos[1].type, PhotoType.image);
      expect(photos[1].url, 'https://example.com/image2.jpg');
      expect(photos[1].createdAt, DateTimeUtil.parseDateTime('2020-02-02'));

      expect(photos[2].id, 3);
      expect(photos[2].type, PhotoType.video);
      expect(photos[2].url, 'https://example.com/video3.mp4');
      expect(photos[2].createdAt, DateTimeUtil.parseDateTime('2020-03-03'));

      expect(photos[3].id, 4);
      expect(photos[3].type, PhotoType.unknown);
      expect(photos[3].url, '');
      expect(photos[3].createdAt,
          DateTimeUtil.parseDateTime('2020-04-04 17:51:04.777'));

      expect(photos[4].id, 5);
      expect(photos[4].type, PhotoType.unknown);
      expect(photos[4].url, 'https://example.com/image5.png');
      expect(photos[4].createdAt, DateTimeUtil.parseDateTime());
    });

    test('getPhoto', () async {
      Photo? photo = await repository.getPhoto(2);

      expect(photo, isNotNull);
      expect(photo!.id, 2);
      expect(photo.type, PhotoType.image);
      expect(photo.url, 'https://example.com/image2.jpg');
      expect(photo.createdAt, DateTime.parse('2020-02-02'));
    });

    test('getPhoto return null', () async {
      Photo? photo = await repository.getPhoto(999);
      expect(photo, isNull);
    });
  });
}
