import 'dart:async';
import 'dart:io';
import 'package:learn_dart_together/17_result_pattern/core/result.dart';
import 'package:learn_dart_together/17_result_pattern/data/data_source/photo_api.dart';
import 'package:learn_dart_together/17_result_pattern/data/dto/photo_dto/photo_dto.dart';
import 'package:learn_dart_together/17_result_pattern/data/mapper/photo_mapper.dart';
import 'package:learn_dart_together/17_result_pattern/data/model/photo.dart';
import 'package:learn_dart_together/17_result_pattern/data/repository/photo_repository.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  final PhotoApi _photoApi;

  const PhotoRepositoryImpl({
    required PhotoApi photoApi,
  }) : _photoApi = photoApi;

  @override
  Future<Result<List<Photo>>> getPhotos(
      {required String firstKeyword, String? secondKeyword}) async {
    try {
      if (firstKeyword == '바보' ||
          (secondKeyword != null && secondKeyword == '바보')) {
        return Result.error('비속어를 키워드로 사용할 수 없습니다');
      }
      List<PhotoDto> dtos = await _photoApi.searchPhotos(
          firstKeyword: firstKeyword, secondKeyword: secondKeyword);
      List<Photo> photos = dtos.map((dto) => dto.toPhoto()).toList();
      return Result.success(photos);
    } on SocketException {
      return Result.error('네트워크 연결 에러가 발생했습니다');
    } on HttpException {
      return Result.error('HTTP 연결 에러가 발생했습니다');
    } on TimeoutException {
      return Result.error('요청 시간이 초과되었습니다');
    } on FormatException {
      return Result.error('데이터 형식 에러가 발생했습니다');
    } catch (error) {
      return Result.error('알 수 없는 오류가 발생했습니다: $error');
    }
  }
}
