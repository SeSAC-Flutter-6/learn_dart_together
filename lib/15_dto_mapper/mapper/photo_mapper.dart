import 'package:learn_dart_together/15_dto_mapper/dto/photo_dto/photo_dto.dart';
import 'package:learn_dart_together/15_dto_mapper/model/photo.dart';
import 'package:learn_dart_together/utils/date_time_util.dart';

extension PhotoMapper on PhotoDto {
  Photo toPhoto() {
    return Photo(
      id: int.tryParse(id?.toString() ?? '0') ?? 0,
      type: _mapPhotoType(type?.toLowerCase()),
      createdAt: DateTimeUtil.parseDateTime(createdAt),
      url: url ?? '',
    );
  }

  PhotoType _mapPhotoType(String? status) {
    switch (status) {
      case 'article':
        return PhotoType.article;
      case 'image':
        return PhotoType.image;
      case 'video':
        return PhotoType.video;
      default:
        return PhotoType.unknown;
    }
  }
}
