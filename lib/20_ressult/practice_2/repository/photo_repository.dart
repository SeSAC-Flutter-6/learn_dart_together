import 'package:learn_dart_together/20_ressult/practice_2/core/result.dart';
import 'package:learn_dart_together/20_ressult/practice_2/model/photo.dart';

abstract interface class PhotoRepository {
  Future<Result<List<Photo>>> getPhotos(String query);
}

enum NetworkError {
  noInternet,
  requestTimeout,
  unknownError,
}

extension NetworkErrorExtension on NetworkError {
  String get message {
    switch (this) {
      case NetworkError.noInternet:
        return '인터넷 연결이 없습니다';
      case NetworkError.requestTimeout:
        return '요청 시간이 초과되었습니다';
      case NetworkError.unknownError:
        return '알 수 없는 네트워크 에러';
      default:
        return '알 수 없는 네트워크 에러';
    }
  }
}
