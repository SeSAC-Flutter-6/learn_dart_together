import 'dart:async';

import 'package:learn_dart_together/17_result/image_search/core/result.dart';
import 'package:learn_dart_together/17_result/image_search/data_source/image_search_api.dart';
import 'package:learn_dart_together/17_result/image_search/exception/network_error.dart';
import 'package:learn_dart_together/17_result/image_search/mapper/photo_mapper.dart';
import 'package:learn_dart_together/17_result/image_search/model/photo.dart';
import 'package:learn_dart_together/17_result/image_search/repository/photo_repository.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  final ImageSearchApi _imageSearchApi;

  PhotoRepositoryImpl(this._imageSearchApi);

  @override
  Future<Result<List<Photo>, ErrorList>> getPhotos(String query) async {
    if (query.contains('바보')) return Result.error(ErrorList.cantUseSlang);

    try {
      final photoDto = await _imageSearchApi.getPhotos(query);
      return Result.success(photoDto.map((dto) => dto.toPhoto()).toList());
    } on TimeoutException {
      return Result.error(ErrorList.requestTimeout);
    } catch (e) {
      return Result.error(ErrorList.unknown);
    }
  }
}
