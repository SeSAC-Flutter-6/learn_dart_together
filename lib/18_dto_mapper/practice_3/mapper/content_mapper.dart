import 'package:learn_dart_together/18_dto_mapper/practice_3/dto/photo_dto.dart';
import 'package:learn_dart_together/18_dto_mapper/practice_3/model/photo.dart';

extension ContentMapper on PhotoDto {
  Photo toPhoto() {
    return Photo(
      id: int.tryParse(id.toString()) ?? 0,
      type: strToType(type),
      url: url ?? '',
      caption: caption ?? '',
      createdAt: DateTime.parse(createdAt ?? ''),
    );
  }

  Type strToType(String? type) {
    switch (type) {
      case 'article':
        return Type.article;
      case 'image':
        return Type.image;
      case 'video':
        return Type.video;
      default:
        return Type.unknown;
    }
  }
}
