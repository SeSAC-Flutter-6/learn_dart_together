import 'package:learn_dart_together/16_result/photo.dart';
import 'package:learn_dart_together/16_result/photo_data_source_impl.dart';
import 'package:learn_dart_together/16_result/photo_repository.dart';
import 'package:learn_dart_together/16_result/photo_repository_impl.dart';
import 'package:learn_dart_together/16_result/result.dart';
import 'package:learn_dart_together/16_result/timeout_photo_data_source_impl.dart';
import 'package:learn_dart_together/16_result/unknown_photo_data_source_impl.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

// Type alias 를 사용하여 반복되는 타입에 대한 사용자 정의
typedef PhotoResult = Error<List<Photo>, PhotoRepositoryError>;

void main() {

  test('10초 이상 지연 시 timeout Exception 발생', () async {
    final datasource = TimeoutPhotoDataSourceImpl();
    final respositoryImpl = PhotoRepositoryImpl(datasource);
    final result = await respositoryImpl.getPhotos('asd');

    // Result 타입을 Error로 Cast
    final error = result as PhotoResult;
    expect(error.error, PhotoRepositoryError.networkTimeout);
  });

  test('비속어 사용 시 Exception 발생', () async {
    final datasource = DefaultPhotoDataSourceImpl();
    final repositoryImpl = PhotoRepositoryImpl(datasource);
    final result = await repositoryImpl.getPhotos('바보');

    // Result 타입을 Error로 Cast
    final error = result as PhotoResult;
    expect(error.error, PhotoRepositoryError.profanityDetected);
  });
  
  test('정의되지 않은 에러 발생 시 unkown Error 반환', () async {
    final datasource = UnknownPhotoDataSourceImpl();
    final repositoryImpl = PhotoRepositoryImpl(datasource);
    final result = await repositoryImpl.getPhotos('apple');
    
    final error = result as PhotoResult;
    expect(error.error, PhotoRepositoryError.unknown);
  });
}