import 'package:learn_dart_together/17_result_pattern/data/dto/photo_dto/photo_dto.dart';
import 'package:learn_dart_together/17_result_pattern/data/model/photo.dart';

extension PhotoMapper on PhotoDto {
  Photo toPhoto() {
    return Photo(
      tags: tags?.split(',').map((tag) => tag.trim()).toList() ?? [],
      imageUrl: pageUrl ?? '',
    );
  }
}
