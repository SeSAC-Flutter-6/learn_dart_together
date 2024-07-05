import 'dart:async';

import 'package:learn_dart_together/20_ressult/practice_2/data_source/mock_unknown_exception_photo_api.dart';
import 'package:test/test.dart';
import 'package:http/http.dart';
import 'package:learn_dart_together/20_ressult/practice_2/core/result.dart';
import 'package:learn_dart_together/20_ressult/practice_2/data_source/mock_photo_api.dart';
import 'package:learn_dart_together/20_ressult/practice_2/data_source/photo_data_source.dart';
import 'package:learn_dart_together/20_ressult/practice_2/dto/photo_result_dto.dart';
import 'package:learn_dart_together/20_ressult/practice_2/model/photo.dart';
import 'package:learn_dart_together/20_ressult/practice_2/repository/photo_repository_impl.dart';
import 'package:learn_dart_together/20_ressult/practice_2/data_source/mock_client_exception_photo_api.dart';
import 'package:learn_dart_together/20_ressult/practice_2/data_source/mock_timeout_exception_photo_api.dart';
import 'package:learn_dart_together/20_ressult/practice_2/data_source/photo_api.dart';
import 'package:learn_dart_together/20_ressult/practice_2/mapper/photo_mapper.dart';

void main() {
  group('PhotoRepositoryImpl getPhotos 테스트', () {
    late PhotoRepositoryImpl repository;
    late PhotoDataSource dataSource;

    setUp(() {
      // 기본 데이터 소스 설정 (필요에 따라 변경 가능)
      dataSource = PhotoApi();
      repository = PhotoRepositoryImpl(dataSource);
    });

    test('쿼리가 비어있으면 에러를 리턴한다', () async {
      final result = await repository.getPhotos('');
      expect(result, isA<Error<List<Photo>>>());
      expect((result as Error<List<Photo>>).e, '쿼리가 비어있습니다');
    });

    test('부적절한 단어가 들어오면 에러를 리턴한다', () async {
      final result = await repository.getPhotos('바보');
      expect(result, isA<Error<List<Photo>>>());
      expect((result as Error<List<Photo>>).e, '비속어를 사용할 수 없습니다');
    });

    test('적절한 단어가 들어오면 동작을 수행한다', () async {
      dataSource = MockPhotoApi();
      repository = PhotoRepositoryImpl(dataSource);
      final result = await repository.getPhotos('valid query');
      final expectedPhotos = [
        Photo(
            tags: ['dandelion', 'flower', 'yellow'],
            imageUrl: 'https://pixabay.com/videos/id-2719/')
      ];
      expect(result, isA<Success<List<Photo>>>());
      expect((result as Success<List<Photo>>).data, expectedPhotos);
    });

    test('TimeoutException가 발생하면 TimeoutException를 throw한다', () async {
      dataSource = MockTimeoutExceptionPhotoApi();
      repository = PhotoRepositoryImpl(dataSource);
      final result = await repository.getPhotos('timeout');
      expect(result, isA<Error<List<Photo>>>());
      expect((result as Error<List<Photo>>).e, '요청 시간이 초과되었습니다');
      expect(() => dataSource.getPhotos('no internet'),
          throwsA(isA<TimeoutException>()));
    });

    test('ClientException가 발생하면 ClientException을 throw한다', () async {
      dataSource = MockClientExceptionPhotoApi();
      repository = PhotoRepositoryImpl(dataSource);
      final result = await repository.getPhotos('no internet');
      expect(result, isA<Error<List<Photo>>>());
      expect((result as Error<List<Photo>>).e, '인터넷 연결이 없습니다');
      expect(() => dataSource.getPhotos('no internet'),
          throwsA(isA<ClientException>()));
    });

    test('알 수 없는 네트워크 에러가 발생하면 Exepction을 throw한다', () async {
      dataSource = MockUnknownExceptionPhotoApi();
      repository = PhotoRepositoryImpl(dataSource);
      final result = await repository.getPhotos('unknown');
      expect(result, isA<Error<List<Photo>>>());
      expect((result as Error<List<Photo>>).e, '알 수 없는 네트워크 에러');
      expect(
          () => dataSource.getPhotos('no internet'), throwsA(isA<Exception>()));
    });
  });
}
