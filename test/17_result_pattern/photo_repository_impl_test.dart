import 'package:learn_dart_together/17_result_pattern/core/result.dart';
import 'package:learn_dart_together/17_result_pattern/data/data_source/photo_api.dart';
import 'package:learn_dart_together/17_result_pattern/data/data_source/photo_api_impl.dart';
import 'package:learn_dart_together/17_result_pattern/data/model/photo.dart';
import 'package:learn_dart_together/17_result_pattern/data/repository/photo_repository_impl.dart';
import 'package:test/test.dart';

void main() {
  late PhotoRepositoryImpl repository;
  late PhotoApi photoApi;

  group('PhotoRepositoryImpl 테스트', () {
    setUp(() {
      photoApi = PhotoApiImpl();
      repository = PhotoRepositoryImpl(photoApi: photoApi);
    });

    test('유효한 키워드로 사진 검색', () async {
      final result = await repository.getPhotos(firstKeyword: 'nature');
      expect(result, isA<Success<List<Photo>, String>>());

      switch (result) {
        case Success(:final data):
          expect(data, isA<List<Photo>>());
        case Error(:final error):
          print(error);
      }
    });

    test('바보 검색시 비속어로 판단', () async {
      final result = await repository.getPhotos(firstKeyword: '바보');

      expect(result, isA<Error<List<Photo>, String>>());

      switch (result) {
        case Success(:final data):
          expect(data, isA<List<Photo>>());
        case Error(:final error):
          expect(error, '비속어를 키워드로 사용할 수 없습니다');
      }
    });

    test('두 개의 키워드로 검색', () async {
      final result =
          await repository.getPhotos(firstKeyword: 'cat', secondKeyword: 'dog');
      expect(result, isA<Success<List<Photo>, String>>());
      switch (result) {
        case Success(:final data):
          expect(data, isA<List<Photo>>());
        case Error(:final error):
          print(error);
      }
    });
  });
}
