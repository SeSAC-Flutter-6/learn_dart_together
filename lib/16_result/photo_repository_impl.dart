import 'dart:async';
import 'package:learn_dart_together/16_result/photo.dart';
import 'package:learn_dart_together/16_result/photo_data_source.dart';
import 'package:learn_dart_together/16_result/photo_mapper.dart';
import 'package:learn_dart_together/16_result/photo_repository.dart';
import 'package:learn_dart_together/16_result/result.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  final PhotoDataSource _dataSource;

  PhotoRepositoryImpl(this._dataSource);

  @override
  Future<Result<List<Photo>, PhotoRepositoryError>> getPhotos(String query) async {
    if (query.contains('바보')) {
      return Result.error(PhotoRepositoryError.profanityDetected);
    }

    try {
      final photoList = await _dataSource.getPhotos(query).timeout(
          Duration(seconds: 10));
      return Result.success(photoList.map((e) => e.toPhoto()).toList());
    } on TimeoutException {
      return Result.error(PhotoRepositoryError.networkTimeout);
    } catch(e) {
      return Result.error(PhotoRepositoryError.unknown);
    }
  }
}