import 'package:learn_dart_together/18_dto_mapper/dto/media_dto.dart';

import '../model/media.dart';

extension MediaMapper on MediaDto {
  Media toMedia() {
    return Media(
      id: id?.toInt() ?? -1,
      type: _getTypeFromString(type),
      caption: caption ?? title ?? 'noCaption',
      content: content ?? 'noContent',
      url: url ?? 'noUrl',
      createdAt: DateTime.parse(createdAt!.replaceAll(' - ', '-')),
    ); //)
  }

  Type _getTypeFromString(String? typeString) {
    switch (typeString) {
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
