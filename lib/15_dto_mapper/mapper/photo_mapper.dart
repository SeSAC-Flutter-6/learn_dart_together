import 'package:learn_dart_together/15_dto_mapper/dto/photo_dto/photo_dto.dart';
import 'package:learn_dart_together/15_dto_mapper/model/photo.dart';

extension PhotoMapper on PhotoDto {
  Photo toPhoto() {
    return Photo(
      id: int.parse(id ?? '0'),
      type: _mapPhotoType(type?.toLowerCase()),
      createdAt: _parseDateTime(createdAt),
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

  //TODO:DateTime을 변환하는건 특정 모델을 가리지 않고 사용할 것 같아서 따로 유틸로 빼는게 나을지도. 일단은 필요할때마다 작성해서 쓰는걸로
  DateTime _parseDateTime(String? dateStr) {
    if (dateStr == null || dateStr.isEmpty) {
      return DateTime.fromMillisecondsSinceEpoch(0);
    }
    try {
      return DateTime.parse(dateStr);
    } catch (e) {
      return DateTime.fromMillisecondsSinceEpoch(0);
    }
  }
}
