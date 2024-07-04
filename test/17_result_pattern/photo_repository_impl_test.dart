import 'package:learn_dart_together/17_result_pattern/core/result.dart';
import 'package:learn_dart_together/17_result_pattern/data/data_source/photo_api.dart';
import 'package:learn_dart_together/17_result_pattern/data/data_source/photo_api_impl.dart';
import 'package:learn_dart_together/17_result_pattern/data/model/photo.dart';
import 'package:learn_dart_together/17_result_pattern/data/repository/photo_repository_impl.dart';
import 'package:test/test.dart';

void main() {
  late PhotoRepositoryImpl repository;
  late PhotoApi photoApi;
  //TODO:wip
  final String moockBaseUrl = '';
  group('PhotoRepositoryImpl 테스트', () {
    setUp(() {
      photoApi = PhotoApiImpl();
      repository = PhotoRepositoryImpl(photoApi: photoApi);
    });

    test('유효한 키워드로 사진 검색', () async {
      final result = await repository.getPhotos(firstKeyword: 'nature');

      expect(result, isA<Success<List<Photo>>>());

      result.when(
        success: (data) {},
        error: (message) {
          fail('에러가 발생하면 안됩니다: $message');
        },
      );
    });

    test('비속어 키워드로 검색 시 에러 반환', () async {
      final result = await repository.getPhotos(firstKeyword: '바보');
    });
    test('존재하지 않는 키워드로 검색 시 빈 리스트 반환', () async {
      final result =
          await repository.getPhotos(firstKeyword: 'asdfghjklqwertyuiop');
    });

    test('두 개의 키워드로 검색', () async {
      final result =
          await repository.getPhotos(firstKeyword: 'cat', secondKeyword: 'dog');
    });
  });
}
