import 'package:learn_dart_together/17_dto/dto/photo_dto.dart';
import 'package:learn_dart_together/17_dto/model/photo.dart';

extension PhotoMapper on PhotoDto {
  Photo toPhoto() {
    return Photo(
      id: int.tryParse(id.toString()) ?? 0,
      type: strToType(type),
      url: url ?? '',
      title: title ?? '',
      content: content ?? '',
      caption: caption ?? '',
      createdAt: DateTime.tryParse(created_at ?? ''),
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
