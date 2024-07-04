import 'dart:async';

import 'package:http/http.dart';
import 'package:learn_dart_together/20_ressult/practice_2/core/result.dart';
import 'package:learn_dart_together/20_ressult/practice_2/data_source/photo_api.dart';
import 'package:learn_dart_together/20_ressult/practice_2/data_source/photo_data_source.dart';
import 'package:learn_dart_together/20_ressult/practice_2/mapper/photo_mapper.dart';
import 'package:learn_dart_together/20_ressult/practice_2/model/photo.dart';
import 'package:learn_dart_together/20_ressult/practice_2/repository/photo_repository.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  final PhotoDataSource _photoDataSource;

  PhotoRepositoryImpl([PhotoDataSource? photoDataSource])
      : _photoDataSource = photoDataSource ?? PhotoApi();

  @override
  Future<Result<List<Photo>>> getPhotos(String query) async {
    try {
      if (query.isEmpty) {
        return Result.error('쿼리가 비어있습니다');
      }
      if (query == '바보') {
        return Result.error('비속어를 사용할 수 없습니다');
      }
      final photoList = await _photoDataSource.getPhotos(query);
      return Result.success(photoList.map((e) => e.toPhoto()).toList());
    } on TimeoutException {
      return Result.error(NetworkError.requestTimeout.message);
    } on ClientException {
      return Result.error(NetworkError.noInternet.message);
    } catch (e) {
      return Result.error(NetworkError.unknownError.message);
    }
  }
}
