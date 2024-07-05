import 'package:learn_dart_together/20_result/practice2/dto/photo_dto.dart';
import 'package:learn_dart_together/20_result/practice2/model/photo.dart';

extension PhotoMapper on PhotoDto {
  Photo toPhoto() {
    return Photo(
        tags: tags?.split(',').map((e) => e).toList() ?? [],
        imageUrl: previewURL ?? '');
  }
}
